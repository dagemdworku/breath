import 'package:breath/breath.dart';

@StackedApp(
  routes: [...RoutesConstant.routes],
  dependencies: [...ServicesConstant.services],
  logger: StackedLogger(),
)
class App {}
