import 'package:breath/breath.dart';
import 'package:stacked_services/stacked_services.dart';

class ServicesConstant {
  static const List<DependencyRegistration> services = [
    /// [ Core Services ]
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
  ];
}
