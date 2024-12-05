import 'package:egs/core/prefs.dart';
import 'package:egs/login/data/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) {
    return UserNotifier();
  },
);

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  Future<void> loadUser() async {
    final user = await prefs.getUser();
    state = user;
  }

  void clearUser() {
    state = null;
  }
  

  bool get isLogged => state != null;

  User? get user => state;
}
