import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'dart:convert';

class Global {
  static SharedPreferences _preferences;
  static Profile profile = Profile();

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    var _profile = _preferences.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        debugPrint(e);
      }
    }
  }

  // 持久化profile 信息
  static saveProfile() {
    _preferences.setString("profile", jsonEncode(profile.toJson()));
  }
}