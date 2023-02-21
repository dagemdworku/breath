import 'package:breath/app/app.locator.dart';
import 'package:breath/app/app.logger.dart';
import 'package:breath/services/services.dart';
import 'package:breath/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

enum AuthenticationViewProgress {
  email,
  password,
  fullName,
  age,
}

class AuthenticationViewModelForm {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController fullNameController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode fullNameFocusNode;

  AuthenticationViewModelForm({
    required this.emailController,
    required this.passwordController,
    required this.fullNameController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.fullNameFocusNode,
  });
}

class AuthenticationViewModel extends IndexTrackingViewModel {
  final log = getLogger('AuthenticationViewModel');

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final DateTime minimumAge =
      DateTime.now().subtract(const Duration(days: 365 * 15));

  late AuthenticationViewModelForm form;

  AuthenticationViewProgress _progress = AuthenticationViewProgress.email;
  AuthenticationViewProgress get progress => _progress;

  String _email = '', _password = '', _fullName = '';

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  bool _runValidation = false;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void onViewModelReady() {
    form = AuthenticationViewModelForm(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      fullNameController: TextEditingController(),
      emailFocusNode: FocusNode(),
      passwordFocusNode: FocusNode(),
      fullNameFocusNode: FocusNode(),
    );

    _dateTime = minimumAge;
  }

  void onChanged({
    String? email,
    String? password,
    String? fullName,
  }) {
    if (email != null) {
      _email = email.trim();
    } else if (password != null) {
      _password = password.trim();
    } else if (fullName != null) {
      _fullName = fullName.trim();
    }

    if (_runValidation) {
      _validate();
    }

    notifyListeners();
  }

  void onDateTimeChanged(DateTime dateTime) {
    log.i(dateTime);
    _dateTime = dateTime;
    notifyListeners();
  }

  void goForward() {
    if (currentIndex < 3) {
      _setFormIndex(currentIndex + 1, true);
    }
  }

  void goBackward() {
    if (currentIndex > -1) {
      _setFormIndex(currentIndex - 1, false);
    }
  }

  void _setFormIndex(int index, bool validate) {
    log.i('index: $index');

    if (validate) {
      _validate();
      if (_errorMessage != null) return;
    } else {
      _errorMessage = null;
    }

    _runValidation = false;

    switch (index) {
      case 1:
        _progress = AuthenticationViewProgress.password;
        form.passwordFocusNode.requestFocus();
        break;
      case 2:
        _progress = AuthenticationViewProgress.fullName;
        form.fullNameFocusNode.requestFocus();
        break;
      case 3:
        _progress = AuthenticationViewProgress.age;
        break;
      default:
        _progress = AuthenticationViewProgress.email;
        form.emailFocusNode.requestFocus();
        break;
    }

    setIndex(index);
  }

  void _validate() {
    _runValidation = true;

    switch (_progress) {
      case AuthenticationViewProgress.email:
        _validateEmail();
        break;
      case AuthenticationViewProgress.password:
        _validatePassword();
        break;
      case AuthenticationViewProgress.fullName:
        _validateFullName();
        break;
      case AuthenticationViewProgress.age:
        _validateAge();
        break;
    }

    if (_errorMessage != null) log.e(_errorMessage);

    notifyListeners();
  }

  void _validateEmail() {
    _errorMessage = null;

    if (_email.isEmpty) {
      _errorMessage = 'email is can not be empty';
    } else if (!StringHelper.isValidEmail(_email)) {
      _errorMessage = 'email is not valid';
    }
  }

  void _validatePassword({bool filledOnly = false}) {
    _errorMessage = null;

    if (_password.isEmpty) {
      _errorMessage = 'password can not be empty';
    } else if (!filledOnly) {
      if (_password.length < 6) {
        _errorMessage = 'password too short';
      } else if (!_password.contains(RegExp(r'[a-z]'))) {
        _errorMessage = 'password must contain at least one small letter';
      } else if (!_password.contains(RegExp(r'[A-Z]'))) {
        _errorMessage = 'password must contain at least one capital letter';
      } else if (!_password.contains(RegExp(r'[0-9]'))) {
        _errorMessage = 'password must contain at least one number';
      } else if (!_password.contains(RegExp(r'[#?!@$%^&*-]'))) {
        _errorMessage =
            'password must contain at least one of the following special characters, #?!@\$%^&*-';
      }
    }
  }

  void _validateFullName() {
    _errorMessage = null;

    if (_fullName.isEmpty) {
      _errorMessage = 'full name can not be empty';
    } else if (_fullName.length < 4) {
      _errorMessage = 'full name too short';
    } else if (!_fullName.contains(' ')) {
      _errorMessage = 'please enter your full name';
    }
  }

  void _validateAge() {
    _errorMessage = null;

    if (_dateTime!.isAfter(minimumAge)) {
      _errorMessage = 'sorry, you are too young to use our platform';
    }
  }

  Future<void> signUp() async {
    _validateFullName();

    if (_errorMessage != null) {
      _setFormIndex(2, false);
      return;
    }

    FirebaseAuthenticationResult result =
        await _authenticationService.createAccountWithEmail(
      _email,
      _password,
      _fullName,
    );

    if (result.hasError) {
      log.e(result.errorMessage);

      _errorMessage = result.errorMessage;
      notifyListeners();
    } else {
      log.i('signed up successfully');
    }
  }

  Future<void> signIn() async {
    _validatePassword(filledOnly: true);

    if (_errorMessage != null) return;

    final FirebaseAuthenticationResult result =
        await _authenticationService.loginWithEmail(
      _email,
      _password,
    );

    if (result.hasError) {
      log.e(result.errorMessage);

      _errorMessage = result.errorMessage;
      notifyListeners();
    } else {
      log.i('signed in successfully');
    }
  }
}
