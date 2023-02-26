import 'package:breath/breath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _minProfileImageSize = 100.0;
const double _verticalTolerance = 32.0;
const double _collapsedAppBarHeight = _minProfileImageSize + _verticalTolerance;

class BUserAppBar extends StatelessWidget {
  final double appBarMaxSize;
  final void Function()? goBack;

  const BUserAppBar({
    super.key,
    required this.appBarMaxSize,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return SliverAppBar(
      elevation: 0,
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      expandedHeight: appBarMaxSize,
      collapsedHeight: _collapsedAppBarHeight,
      toolbarHeight: _collapsedAppBarHeight,
      backgroundColor: Colors.blueGrey.shade100,
      flexibleSpace: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final bool showLarge =
              constraints.maxHeight >= appBarMaxSize - _verticalTolerance;

          final bool showMedium = constraints.maxHeight >
              _minProfileImageSize + _verticalTolerance * 3;

          final bool reduceAnimation =
              showLarge && constraints.maxHeight > appBarMaxSize;

          double width = _minProfileImageSize, height = _minProfileImageSize;
          BorderRadiusGeometry borderRadius = BorderRadius.circular(100.0);

          if (showLarge) {
            width = constraints.maxWidth;
            height = constraints.maxHeight;
            borderRadius = BorderRadius.circular(0.0);
          } else if (showMedium) {
            width = constraints.maxHeight - _verticalTolerance * 2;
            height = constraints.maxHeight - _verticalTolerance * 2;
            borderRadius = BorderRadius.circular(16.0);
          }

          return Stack(
            children: [
              Center(
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
              ),
              if (Navigator.canPop(context))
                Positioned(
                  top: 0,
                  left: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BFilledButton(
                        icon: CupertinoIcons.left_chevron,
                        backgroundColor: Colors.blueGrey.shade100.withOpacity(
                          0.5,
                        ),
                        contentColor: Colors.blueGrey.shade600,
                        onTap: goBack,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
