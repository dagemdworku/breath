import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.runStartupLogic(),
      builder: (context, model, child) => const Scaffold(
        body: Text('checking signed in user...'),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
