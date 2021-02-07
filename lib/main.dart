import 'package:e_shop_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:e_shop_flutter/common/global.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'index.dart';

import 'package:provider/provider.dart';

void main() {
    // 将debugPrint指定为同步打印数据 
  debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);
  
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  
    Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    debugPrint("routeName: $routeName");
    if (routeList.containsKey(routeName)) {
      var f = routeList[routeName];
      return MaterialPageRoute(builder: f);
    }
    return null;
  }

  Route<dynamic> _onUnknownRoute(RouteSettings settings) {
    String name = settings.name;
    debugPrint("未匹配到路由：$name");
    return MaterialPageRoute(builder: routeList["/error_page"]);
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: LocaleProvider()),
        ],
      child: Consumer<LocaleProvider>(
        builder: (BuildContext context, localeProvider, child) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Color(0xff3e5982),
              scaffoldBackgroundColor: Color(0xfff7f7f8),
              textTheme: TextTheme(
                  headline1: TextStyle(color: Color(0xff28333d), fontSize: 18, fontWeight: FontWeight.w500), 
                  headline2: TextStyle(color: Color(0xff28333d), fontSize: 13, fontWeight: FontWeight.w500),
                  headline3: TextStyle(color: Color(0xffaaabac), fontSize: 15), // search placeholder
                  headline4: TextStyle(color: Color(0xff2e5982), fontSize: 19, fontWeight: FontWeight.w500)
                )
              ),
            routes: routeList,
            initialRoute: "/eshop_home_page",
            onGenerateRoute: _onGenerateRoute,
            onUnknownRoute: _onUnknownRoute,
            locale: localeProvider.getLocal(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: 
            (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeProvider.getLocal() != null) {
                return localeProvider.getLocal();
              }else {
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                }else {
                  locale = Locale("en");
                }
                return locale;
              }
            },
          );
        },
        ),
      );
  }
}
