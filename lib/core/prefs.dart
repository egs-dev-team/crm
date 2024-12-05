import 'dart:convert';

import 'package:egs/core/api.dart';
import 'package:egs/login/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Prefs prefs;

class Prefs {
  late SharedPreferences prefs;

  Prefs() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getToken() {
    return prefs.getString('token');
  }

  User? getUserData() {
    if (prefs.getString('user') == null) {
      return null;
    } else {
      return User.fromJson(jsonDecode(prefs.getString('user')!));
    }
  }

  void setUser(User user) async {
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    String? token = getToken();
    User? user = getUserData();
    if (token == null) {
      return null;
    } else {
      if (user == null) {
        final data = await apiService.fetchUserData();
        setUser(data);
        return data;
      } else {
        return user;
      }
    }
  }

  bool hasUserAndToken() {
    return getToken() != null && getUserData() != null;
  }

  void setToken(String token) async {
    await prefs.setString('token', token);
  }

  Future<void> clear() async {
    prefs.clear();
  }
}
