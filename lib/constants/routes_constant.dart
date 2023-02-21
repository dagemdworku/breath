import 'package:breath/ui/views/views.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class RoutesConstant {
  static const List<StackedRoute<dynamic>> routes = [
    CustomRoute(
      page: AuthenticationView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: WrapperView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
