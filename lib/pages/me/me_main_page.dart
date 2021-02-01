import 'package:flutter/material.dart';


class MeMainPage extends StatefulWidget {
  @override
  _MeMainPageState createState() => _MeMainPageState();
}

class _MeMainPageState extends State<MeMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("我的"),),
    );
  }
}