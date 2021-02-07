// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tab_bar_home {
    return Intl.message(
      'Home',
      name: 'tab_bar_home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get tab_bar_catetory {
    return Intl.message(
      'Category',
      name: 'tab_bar_catetory',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get tab_bar_cart {
    return Intl.message(
      'Cart',
      name: 'tab_bar_cart',
      desc: '',
      args: [],
    );
  }

  /// `BL`
  String get tab_bar_bl {
    return Intl.message(
      'BL',
      name: 'tab_bar_bl',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get tab_bar_me {
    return Intl.message(
      'My',
      name: 'tab_bar_me',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get me_my_order {
    return Intl.message(
      'My Order',
      name: 'me_my_order',
      desc: '',
      args: [],
    );
  }

  /// `All orders`
  String get me_all_orders {
    return Intl.message(
      'All orders',
      name: 'me_all_orders',
      desc: '',
      args: [],
    );
  }

  /// `After salse`
  String get me_after_sale {
    return Intl.message(
      'After salse',
      name: 'me_after_sale',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get me_unpaid {
    return Intl.message(
      'Unpaid',
      name: 'me_unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Undelivered`
  String get me_undelivered {
    return Intl.message(
      'Undelivered',
      name: 'me_undelivered',
      desc: '',
      args: [],
    );
  }

  /// `Unreceived`
  String get me_unreceived {
    return Intl.message(
      'Unreceived',
      name: 'me_unreceived',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get me_wallet {
    return Intl.message(
      'Wallet',
      name: 'me_wallet',
      desc: '',
      args: [],
    );
  }

  /// `About Echain`
  String get me_about {
    return Intl.message(
      'About Echain',
      name: 'me_about',
      desc: '',
      args: [],
    );
  }

  /// `Login/Sign up`
  String get me_loginSignup {
    return Intl.message(
      'Login/Sign up',
      name: 'me_loginSignup',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get me_setting {
    return Intl.message(
      'Setting',
      name: 'me_setting',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get home_search {
    return Intl.message(
      'search',
      name: 'home_search',
      desc: '',
      args: [],
    );
  }

  /// `Recommend brand`
  String get home_recommend_brand_title {
    return Intl.message(
      'Recommend brand',
      name: 'home_recommend_brand_title',
      desc: '',
      args: [],
    );
  }

  /// `Hot goods`
  String get home_hot_goods_title {
    return Intl.message(
      'Hot goods',
      name: 'home_hot_goods_title',
      desc: '',
      args: [],
    );
  }

  /// `Hot sale goods`
  String get home_hot_sale_title {
    return Intl.message(
      'Hot sale goods',
      name: 'home_hot_sale_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}