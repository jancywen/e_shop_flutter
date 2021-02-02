import 'package:flutter/material.dart';


class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Text("首页"),),
    );
  }
}