import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class BPageTransition extends StatelessWidget {
  final Widget child;
  final bool reverse;
  final bool fillScreen;
  final SharedAxisTransitionType transitionType;

  const BPageTransition({
    Key? key,
    required this.child,
    required this.reverse,
    this.fillScreen = true,
    this.transitionType = SharedAxisTransitionType.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: reverse,
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          child: fillScreen
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -1,
                      left: -1,
                      right: -1,
                      bottom: -1,
                      child: child,
                    ),
                  ],
                )
              : child,
        );
      },
      child: child,
    );
  }
}
