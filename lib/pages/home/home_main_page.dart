import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  String testStr;

  static const platform = MethodChannel("ESHOPCHANNEL");

  @override
  void initState() {
    super.initState();
    _testChannel();
  }

  _testChannel() async {
    var str;
    try {
      str = await platform.invokeMethod<String>('testChannel');
      setState(() {
        testStr = str;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Text(testStr ?? ""),),
    );
  }
}