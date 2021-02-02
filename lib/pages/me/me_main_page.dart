import 'package:flutter/material.dart';
import 'widget/me_user_info_widget.dart';
import 'widget/me_order_statistics_widget.dart';
import 'widget/me_list_item_widget.dart';

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
    super.build(context);
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(children: [
          Positioned(child: Image.asset("images/me-icon/me-header-bg@2x.png", fit: BoxFit.cover, height: 152,)),
          Positioned(child: Image.asset("images/me-icon/me-header-logo@2x.png", fit: BoxFit.cover, width: 77, height: 16,), top:33, right: 15),
          Positioned(child: 
            Container(
              margin: EdgeInsets.only(top: 64),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _createHeaderWidget()
                  ),
                  SliverToBoxAdapter(
                    child: _createContentWidget(),
                  )
                ],
              ),
              ))
        ],),
        ),
    );
  }

Widget _createHeaderWidget() {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
    height: 188,
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(4))
      ),
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left:15, right: 15), child: MeUserInfoWidget()),
        MeOrderStatisticsWidget(),
        ]
      ),
  );
}

Widget _createContentWidget() {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(4))
      ),
    child: Column(
      children: [
        MeListItemWidget(item: MeMainItemType.about),
        MeListItemWidget(item: MeMainItemType.setting),
      ],
    ),
  );
}

}

