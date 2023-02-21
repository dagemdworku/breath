import 'package:breath/constants/routes_constant.dart';
import 'package:breath/constants/services_constant.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [...RoutesConstant.routes],
  dependencies: [...ServicesConstant.services],
  logger: StackedLogger(),
)
class App {}
