import 'package:animations/animations.dart';
import 'package:breath/ui/views/views.dart';
import 'package:breath/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'wrapper_viewmodel.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: BPageTransition(
          reverse: model.reverse,
          transitionType: SharedAxisTransitionType.horizontal,
          child: _selectView(model),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: model.setViewIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      viewModelBuilder: () => WrapperViewModel(),
    );
  }

  Widget _selectView(WrapperViewModel model) {
    switch (model.currentPage) {
      case CurrentPage.home:
        return const HomeView();
      case CurrentPage.settings:
        return const SettingsView();
    }
  }
}
