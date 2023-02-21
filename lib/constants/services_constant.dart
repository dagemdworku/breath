import 'package:breath/services/services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class ServicesConstant {
  static const List<DependencyRegistration> services = [
    /// [ Core Services ]
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
  ];
}
