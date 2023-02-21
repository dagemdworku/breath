import 'package:breath/constants/routes_constant.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [...RoutesConstant.routes],
  dependencies: [],
  logger: StackedLogger(),
)
class App {}
