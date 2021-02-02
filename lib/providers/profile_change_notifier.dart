import 'package:flutter/material.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:e_shop_flutter/common/global.dart';
import '../index.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

//用户状态
class UserProvider extends ProfileChangeNotifier {
  User get user => _profile.user;

  // 是否已登录
  bool get isLogin => user != null;

  set user(User user) {
    if (user.login != _profile.user?.login) {
      _profile.user = user;
      notifyListeners();
    }
  }
}

class LocaleProvider extends ProfileChangeNotifier {
  //获取当前用户的APP语言配置Local类，如果为null， 则语言跟随系统语言
  Locale getLocal() {
    if (_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    Locale locale;
    // if (t.length == 2) {
    //   locale = Locale(t[0], t[1]);
    // }
    locale = Locale(t[0]);
    return locale;
  }

  String get locale => _profile.locale;

  set locale(String localeStr) {
    if (localeStr != _profile.locale) {
      _profile.locale = localeStr;
    }

    Locale locale;
    if (localeStr == null) {
      locale = Locale('en');
    }else {
      var t = localeStr.split("_");
      if (t.length ==2) {
          locale = Locale(t[0], t[1]);
        }else {
          locale = Locale(t[0]); 
        }
    }
    S.load(locale);
    notifyListeners();
  }
}