import 'package:breath/breath.dart';
import 'package:flutter/material.dart';

import 'home_viewmodel.dart';

const double _minProfileImageSize = 100.0;
const double _maxProfileImageSize = 200.0;

const double _verticalTolerance = 32.0;

const double _collapsedAppBarHeight = _minProfileImageSize + _verticalTolerance;
const double _expandedAppBarHeight = _maxProfileImageSize + _verticalTolerance;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                pinned: true,
                stretch: true,
                automaticallyImplyLeading: true,
                expandedHeight: _expandedAppBarHeight,
                collapsedHeight: _collapsedAppBarHeight,
                toolbarHeight: _collapsedAppBarHeight,
                backgroundColor: themeData.scaffoldBackgroundColor,
                flexibleSpace: LayoutBuilder(
                  builder: (
                    BuildContext context,
                    BoxConstraints constraints,
                  ) {
                    final bool showLarge = constraints.maxHeight >=
                        _maxProfileImageSize + _verticalTolerance;

                    final double width =
                        showLarge ? _maxProfileImageSize : _minProfileImageSize;
                    final double height =
                        showLarge ? _maxProfileImageSize : _minProfileImageSize;

                    final BorderRadiusGeometry borderRadius = showLarge
                        ? BorderRadius.circular(8.0)
                        : BorderRadius.circular(100.0);

                    return Center(
                      child: AnimatedContainer(
                        width: width,
                        height: height,
                        clipBehavior: Clip.hardEdge,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: borderRadius,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: true,
                child: Material(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
