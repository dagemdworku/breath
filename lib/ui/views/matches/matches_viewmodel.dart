import 'package:breath/breath.dart';
import 'package:stacked_services/stacked_services.dart';

class MatchesViewModel extends BaseViewModel {
  final log = getLogger('MatchesViewModel');

  final NavigationService _navigationService = locator<NavigationService>();

  void gotoMatch(String matchId) {
    _navigationService.navigateTo(
      Routes.matchView,
      arguments: MatchViewArguments(matchId: matchId),
    );
  }
}
