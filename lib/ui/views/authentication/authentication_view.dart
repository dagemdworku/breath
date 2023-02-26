import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authentication_viewmodel.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  child: const SizedBox(width: 50.0, height: 50.0),
                ),
              ),
              Expanded(
                child: BPageTransition(
                  fillScreen: true,
                  reverse: model.reverse,
                  child: _formField(model),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Material(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  if (model.progress == AuthenticationViewProgress.email)
                    Expanded(
                      child: BFilledButton(
                        key: const Key('continue'),
                        text: 'continue',
                        fillWidth: true,
                        onTap: model.goForward,
                      ),
                    ),
                  if (model.progress ==
                      AuthenticationViewProgress.password) ...[
                    Expanded(
                      child: BFilledButton(
                        key: const Key('sign_in'),
                        text: 'sign in',
                        isBusy: model.isSignInBusy,
                        fillWidth: true,
                        isOutlined: true,
                        onTap: model.signIn,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                  ],
                  if (model.progress == AuthenticationViewProgress.password ||
                      model.progress == AuthenticationViewProgress.fullName)
                    Expanded(
                      child: BFilledButton(
                        key: const Key('sign up'),
                        text: 'sign up',
                        isBusy: model.isSignUpBusy,
                        fillWidth: true,
                        onTap: model.progress ==
                                AuthenticationViewProgress.password
                            ? model.goForward
                            : model.signUp,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AuthenticationViewModel(),
    );
  }

  Widget _formField(AuthenticationViewModel viewModel) {
    switch (viewModel.progress) {
      case AuthenticationViewProgress.email:
        return _FormField(
          key: const Key('email'),
          child: BTextField(
            hintText: 'please enter your email',
            helperText: 'email address',
            autofocus: true,
            errorText: viewModel.errorMessage,
            controller: viewModel.form.emailController,
            focusNode: viewModel.form.emailFocusNode,
            onChanged: (email) => viewModel.onChanged(email: email),
            onEditingComplete: viewModel.goForward,
          ),
        );
      case AuthenticationViewProgress.password:
        return _FormField(
          key: const Key('password'),
          topWidget: Row(
            children: [
              BFilledButton(
                icon: CupertinoIcons.back,
                backgroundColor: Colors.blueGrey.shade50,
                contentColor: Colors.blueGrey.shade500,
                onTap: viewModel.goBackward,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.form.emailController.text.trim(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        height: 24 / 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'change email address',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          child: BTextField(
            hintText: 'please enter your password',
            helperText: 'password',
            errorText: viewModel.errorMessage,
            controller: viewModel.form.passwordController,
            focusNode: viewModel.form.passwordFocusNode,
            obscureText: true,
            onChanged: (password) => viewModel.onChanged(password: password),
          ),
        );
      case AuthenticationViewProgress.fullName:
        return _FormField(
          key: const Key('full_name'),
          child: BTextField(
            hintText: 'please enter your full name',
            helperText: 'full name',
            errorText: viewModel.errorMessage,
            controller: viewModel.form.fullNameController,
            focusNode: viewModel.form.fullNameFocusNode,
            onChanged: (fullName) => viewModel.onChanged(fullName: fullName),
            onEditingComplete: viewModel.goForward,
          ),
        );
    }
  }
}

class _FormField extends StatelessWidget {
  final Widget child;
  final Widget? topWidget;

  const _FormField({
    super.key,
    required this.child,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (topWidget != null) ...[
                topWidget!,
                const SizedBox(height: 8.0),
              ],
              child,
              if (topWidget != null) ...[
                const SizedBox(height: 50.0),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
