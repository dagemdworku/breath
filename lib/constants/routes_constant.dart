import 'package:breath/ui/views/wrapper/wrapper_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class RoutesConstant {
  static const List<StackedRoute<dynamic>> routes = [
    CustomRoute(
      page: WrapperView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
