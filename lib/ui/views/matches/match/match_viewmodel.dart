import 'package:breath/breath.dart';
import 'package:stacked_services/stacked_services.dart';

class MatchViewModel extends BaseViewModel {
  final log = getLogger('MatchViewModel');

  final NavigationService _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }
}
