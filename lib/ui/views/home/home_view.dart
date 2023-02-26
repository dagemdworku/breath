import 'dart:math';

import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_viewmodel.dart';

const double _minProfileImageSize = 100.0;
const double _verticalTolerance = 32.0;
const double _collapsedAppBarHeight = _minProfileImageSize + _verticalTolerance;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final double topPadding = MediaQuery.of(context).padding.top;

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          final double layoutWidth = constraints.maxWidth;
          final double layoutHeight = constraints.maxHeight;

          final double appBarMaxSize = max(layoutWidth, layoutHeight / 2);

          return Material(
            color: themeData.scaffoldBackgroundColor,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  stretch: true,
                  automaticallyImplyLeading: true,
                  expandedHeight: appBarMaxSize,
                  collapsedHeight: _collapsedAppBarHeight,
                  toolbarHeight: _collapsedAppBarHeight,
                  backgroundColor: Colors.blueGrey.shade100,
                  flexibleSpace: LayoutBuilder(
                    builder: (
                      context,
                      constraints,
                    ) {
                      final bool showLarge = constraints.maxHeight >=
                          appBarMaxSize - _verticalTolerance;

                      final bool showMedium = constraints.maxHeight >
                          _minProfileImageSize + _verticalTolerance * 3;

                      final bool reduceAnimation =
                          showLarge && constraints.maxHeight > appBarMaxSize;

                      double width = _minProfileImageSize,
                          height = _minProfileImageSize;
                      BorderRadiusGeometry borderRadius =
                          BorderRadius.circular(100.0);

                      if (showLarge) {
                        width = constraints.maxWidth;
                        height = constraints.maxHeight;
                        borderRadius = BorderRadius.circular(0.0);
                      } else if (showMedium) {
                        width = constraints.maxHeight - _verticalTolerance * 2;
                        height = constraints.maxHeight - _verticalTolerance * 2;
                        borderRadius = BorderRadius.circular(16.0);
                      }

                      return Center(
                        child: AnimatedContainer(
                          width: width,
                          height: height,
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(
                            top: showLarge ? 0.0 : topPadding,
                          ),
                          duration: Duration(
                            milliseconds: reduceAnimation ? 0 : 100,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade600,
                            borderRadius: borderRadius,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: _UserInformation(),
                ),
              ],
            ),
          );
        }),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle nameStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 48,
      height: 60 / 48,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade900,
    );

    final TextStyle bioStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      height: 30 / 20,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey.shade900,
    );

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dagem D', style: nameStyle),
          Text('Worku', style: nameStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8.0),
          const _Information(text: 'City', icon: CupertinoIcons.house_alt_fill),
          const _Information(text: 'Job Title', icon: Icons.business_center),
          const SizedBox(height: 8.0),
          Text(
            'Sunt ad pariatur proident excepteur amet nulla laborum. Et mollit consectetur ullamco esse fugiat ea est elit adipisicing commodo ullamco mollit laborum quis. Eu dolor incididunt nisi pariatur amet officia culpa cillum ipsum nisi.',
            style: bioStyle,
          ),
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Information({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
      height: 30 / 20,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade800,
    );

    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.blueGrey.shade700,
        ),
        const SizedBox(width: 8.0),
        Text(text, style: textStyle)
      ],
    );
  }
}
