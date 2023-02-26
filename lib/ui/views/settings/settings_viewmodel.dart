import 'package:breath/breath.dart';

class SettingsViewModel extends BaseViewModel {
  final log = getLogger('SettingsViewModel');

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  void signOut() {
    log.i('');
    _authenticationService.logout();
  }
}
