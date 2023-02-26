import 'package:breath/breath.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');

  final NavigationService _navigationService = locator<NavigationService>();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  void runStartupLogic() {
    _authenticationService.firebaseAuth.authStateChanges().listen((user) async {
      bool hasUser = user?.uid != null;
      if (hasUser) {
        gotoWrapper();
      } else {
        gotoAuth();
      }
    });
  }

  void gotoWrapper() {
    _navigationService.clearStackAndShow(Routes.wrapperView);
  }

  void gotoAuth() {
    _navigationService.clearStackAndShow(Routes.authenticationView);
  }
}
