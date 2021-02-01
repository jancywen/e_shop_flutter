import 'package:e_shop_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
    // 将debugPrint指定为同步打印数据 
  debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);

  runApp(MyApp());
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
    return MaterialApp(
      title: 'E-Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routeList,
      initialRoute: "/eshop_home_page",
      onGenerateRoute: _onGenerateRoute,
      onUnknownRoute: _onUnknownRoute,
    );
  }
}
