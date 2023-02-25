import 'package:breath/breath.dart';

class RoutesConstant {
  static const List<StackedRoute<dynamic>> routes = [
    CustomRoute(
      page: StartupView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: AuthenticationView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: WrapperView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
