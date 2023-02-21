import 'package:breath/app/app.logger.dart';
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
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  AuthenticationViewModelForm({
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });
}

class AuthenticationViewModel extends IndexTrackingViewModel {
  final log = getLogger('AuthenticationViewModel');

  late AuthenticationViewModelForm form;

  AuthenticationViewProgress _progress = AuthenticationViewProgress.email;
  AuthenticationViewProgress get progress => _progress;

  void onViewModelReady() {
    form = AuthenticationViewModelForm(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      emailFocusNode: FocusNode(),
      passwordFocusNode: FocusNode(),
    );
  }

  void setFormIndex(int index) {
    log.i('index: $index');

    switch (index) {
      case 1:
        _progress = AuthenticationViewProgress.password;
        break;
      case 2:
        _progress = AuthenticationViewProgress.fullName;
        break;
      case 3:
        _progress = AuthenticationViewProgress.age;
        break;
      default:
        _progress = AuthenticationViewProgress.email;
        break;
    }

    setIndex(index);
  }

  void signUp() {}

  void signIn() {}
}
