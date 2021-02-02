import 'package:flutter/material.dart';

class BlMainPage extends StatefulWidget {
  @override
  _BlMainPageState createState() => _BlMainPageState();
}

class _BlMainPageState extends State<BlMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Text("提货单"),),
    );
  }
}