import 'package:flutter/material.dart';
import 'package:e_shop_flutter/widget/search_bar_widget.dart';

class BlMainPage extends StatefulWidget {
  @override
  _BlMainPageState createState() => _BlMainPageState();
}

class _BlMainPageState extends State<BlMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  
  void _onTapSearch() {

  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(onTap: _onTapSearch,),
          
        ]
      ),
    );
  }
}