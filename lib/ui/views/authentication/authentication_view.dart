import 'package:breath/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'authentication_viewmodel.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: BPageTransition(
            fillScreen: true,
            reverse: model.reverse,
            child: _formField(model),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: model.currentIndex > 0
            ? BFilledButton(
                icon: CupertinoIcons.back,
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                onTap: model.goBackward,
              )
            : null,
        bottomSheet: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                if (model.progress == AuthenticationViewProgress.email ||
                    model.progress == AuthenticationViewProgress.fullName)
                  Expanded(
                    child: BFilledButton(
                      key: const Key('continue'),
                      text: 'continue',
                      fillWidth: true,
                      onTap: model.goForward,
                    ),
                  ),
                if (model.progress == AuthenticationViewProgress.password) ...[
                  Expanded(
                    child: BFilledButton(
                      key: const Key('sign_in'),
                      text: 'sign in',
                      fillWidth: true,
                      onTap: model.signIn,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                ],
                if (model.progress == AuthenticationViewProgress.password ||
                    model.progress == AuthenticationViewProgress.age)
                  Expanded(
                    child: BFilledButton(
                      key: const Key('sign up'),
                      text: 'sign up',
                      fillWidth: true,
                      onTap: model.signUp,
                    ),
                  ),
              ],
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
          child: BTextField(
            hintText: 'please enter your password',
            helperText: 'password',
            errorText: viewModel.errorMessage,
            controller: viewModel.form.passwordController,
            focusNode: viewModel.form.passwordFocusNode,
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
            autofocus: viewModel.form.fullNameController.text.isEmpty,
            onChanged: (fullName) => viewModel.onChanged(fullName: fullName),
            onEditingComplete: viewModel.goForward,
          ),
        );

      case AuthenticationViewProgress.age:
        return _FormField(
          child: BDateTimePicker(
            maxHeight: 300.0,
            maximumYear: viewModel.minimumAge.year,
            minimumYear: 1950,
            initialDateTime: viewModel.dateTime,
            onDateTimeChanged: viewModel.onDateTimeChanged,
          ),
        );
    }
  }
}

class _FormField extends StatelessWidget {
  final Widget child;

  const _FormField({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: child,
      ),
    );
  }
}
