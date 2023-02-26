import 'package:breath/breath.dart';
import 'package:flutter/material.dart';

enum AuthenticationViewProgress {
  email,
  password,
  fullName,
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

  late AuthenticationViewModelForm form;

  AuthenticationViewProgress _progress = AuthenticationViewProgress.email;
  AuthenticationViewProgress get progress => _progress;

  String _email = '', _password = '', _fullName = '';

  bool _runValidation = false;

  bool _isSignUpBusy = false;
  bool get isSignUpBusy => _isSignUpBusy;

  bool _isSignInBusy = false;
  bool get isSignInBusy => _isSignInBusy;

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
  }

  void onChanged({
    String? email,
    String? password,
    String? fullName,
  }) {
    if (email != null) {
      _email = email.toLowerCase().trim();
    } else if (password != null) {
      _password = password.trim();
    } else if (fullName != null) {
      _fullName = fullName.toLowerCase().trim();
    }

    if (_runValidation) {
      _validate();
    }

    notifyListeners();
  }

  void goForward() {
    if (currentIndex < 2) {
      _setFormIndex(currentIndex + 1, true);
    }
  }

  void goBackward() {
    if (currentIndex > -1) {
      _setFormIndex(currentIndex - 1, false);
    }
  }

  Future<void> signUp() async {
    log.i('');
    _validateFullName();

    if (_errorMessage != null) return;

    _setIsSignUpBusy(true);
    try {
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

      _setIsSignUpBusy(false);
    } catch (e) {
      _setIsSignUpBusy(false);
      log.e(e);
    }
  }

  Future<void> signIn() async {
    log.i('');
    _validatePassword(filledOnly: true);

    if (_errorMessage != null) return;

    _setIsSignInBusy(true);

    try {
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

      _setIsSignInBusy(false);
    } catch (e) {
      _setIsSignInBusy(false);
      log.e(e);
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

    notifyListeners();
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

    notifyListeners();
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

    notifyListeners();
  }

  void _setIsSignUpBusy(bool value) {
    _isSignUpBusy = value;
    notifyListeners();
  }

  void _setIsSignInBusy(bool value) {
    _isSignInBusy = value;
    notifyListeners();
  }
}
