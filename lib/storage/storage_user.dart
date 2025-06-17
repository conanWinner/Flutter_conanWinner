import 'dart:convert';

import 'package:flutter_w1/data/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUser {
  static const String _userInfoKey = 'user_info';

  static Future<void> saveUser(User userInfor) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userInfoKey, jsonEncode(userInfor.toJson()));
    print("Da luu user");
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userInfoKey);

    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      // print("Da lay user ${userMap}");
      return User.fromJson(userMap);
    }
  }

  // Logout
  static Future<bool> clearUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_userInfoKey);
    } catch (e) {
      print('Error clearing user info: $e');
      return false;
    }
  }
}
