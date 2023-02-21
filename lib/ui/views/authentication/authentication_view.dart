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
                onTap: () => model.setFormIndex(model.currentIndex - 1),
              )
            : null,
        bottomSheet: SizedBox(
          width: double.infinity,
          child: BFilledButton(
            text: 'Continue',
            fillWidth: true,
            margin: const EdgeInsets.all(12.0),
            onTap: () => model.setFormIndex(model.currentIndex + 1),
          ),
        ),
      ),
      viewModelBuilder: () => AuthenticationViewModel(),
    );
  }

  Widget _formField(AuthenticationViewModel viewModel) {
    switch (viewModel.progress) {
      case AuthenticationViewProgress.email:
        return const Center(key: Key('email'), child: Text('email'));
      case AuthenticationViewProgress.password:
        return const Center(key: Key('password'), child: Text('password'));
      case AuthenticationViewProgress.fullName:
        return const Center(key: Key('name'), child: Text('full name'));
      case AuthenticationViewProgress.age:
        return const Center(key: Key('age'), child: Text('age'));
    }
  }
}
