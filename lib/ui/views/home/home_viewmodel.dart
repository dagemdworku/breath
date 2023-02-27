import 'dart:math';

import 'package:breath/breath.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final UserService _userService = locator<UserService>();

  final Random random = Random();

  List<User> _users = [];

  User? _user;
  User? get user => _user;

  void onViewModelReady() {
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      _users = await _userService.all();
      log.i('${_users.length} users fetched');

      _pickUser();
    } catch (e) {
      log.e(e);
    }
  }

  void _pickUser() {
    if (_users.isEmpty) return;

    int userIndex = random.nextInt(_users.length);
    _user = _users[userIndex];

    if (_user != null) {
      log.i('user: ${_user!.toJson()}');
      notifyListeners();
    }
  }
}
