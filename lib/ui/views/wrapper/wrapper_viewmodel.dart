import 'package:breath/breath.dart';

enum CurrentPage { home, settings }

class WrapperViewModel extends IndexTrackingViewModel {
  final log = getLogger('WrapperViewModel');

  CurrentPage _currentPage = CurrentPage.home;
  CurrentPage get currentPage => _currentPage;

  void setViewIndex(int index) {
    log.i('index: $index');

    switch (index) {
      case 1:
        _currentPage = CurrentPage.settings;
        break;
      default:
        _currentPage = CurrentPage.home;
        break;
    }

    setIndex(index);
  }
}
