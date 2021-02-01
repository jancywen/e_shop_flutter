
import 'package:flutter/material.dart';


import 'pages/index.dart';


Map<String, Widget Function(BuildContext)> routeList = {
  "/eshop_home_page": (context) => EShopHomePage(),
  "/error_page": (context) => ErrorPage(),
};