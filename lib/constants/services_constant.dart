import 'package:breath/services/services.dart';
import 'package:stacked/stacked_annotations.dart';

class ServicesConstant {
  static const List<DependencyRegistration> services = [
    /// [ Core Services ]
    LazySingleton(classType: AuthenticationService),
  ];
}
