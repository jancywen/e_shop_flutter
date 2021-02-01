import 'package:flutter/material.dart';


class CartMainPage extends StatefulWidget {
  @override
  _CartMainPageState createState() => _CartMainPageState();
}

class _CartMainPageState extends State<CartMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("购物车"),),
    );
  }
}