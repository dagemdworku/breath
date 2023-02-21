import 'package:breath/app/app.locator.dart';
import 'package:breath/app/app.logger.dart';
import 'package:breath/app/app.router.dart';
import 'package:breath/services/services.dart';
import 'package:stacked/stacked.dart';
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
    _navigationService.navigateToWrapperView();
  }

  void gotoAuth() {
    _navigationService.navigateToAuthenticationView();
  }
}
