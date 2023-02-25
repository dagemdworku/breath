import 'package:breath/breath.dart';
import 'package:flutter/material.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text(
            'this is settings',
          ),
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
