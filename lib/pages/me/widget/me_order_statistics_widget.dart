import 'package:flutter/material.dart';
import 'normal_text_row_widget.dart';
import 'package:e_shop_flutter/generated/l10n.dart';

class MeOrderStatisticsWidget extends StatelessWidget {

  final List<OrderStatisticsItem> items = [
    OrderStatisticsItem(icon: "images/me-icon/me-order-unpay@2x.png", title: "待付款", number: 5),
    OrderStatisticsItem(icon: "images/me-icon/me-order-undelivery@2x.png", title: "待发货", number: 5),
    OrderStatisticsItem(icon: "images/me-icon/me-order-unreceipt@2x.png", title: "待收货", number: 5),
    OrderStatisticsItem(icon: "images/me-icon/me-order-after-sale@2x.png", title: "售后", number: 5)
    ];
  @override
  Widget build(BuildContext context) {
    var gm = S.of(context);

    return Container(
      height: 110,
      // padding: EdgeInsets.only(left:15, right: 15, top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left:15, right: 15, top: 12), 
            child: NormalTextRowWidget(title: gm.me_my_order,subTitle: gm.me_all_orders,),
            ),
          Expanded(child: _orderStatisticsWidget(gm)),
        ]
      ),
    );
  }

  Widget _orderStatisticsWidget(S gm) {
    var items = [
      OrderStatisticsItem(icon: "images/me-icon/me-order-unpay@2x.png", title: gm.me_unpaid, number: 5),
      OrderStatisticsItem(icon: "images/me-icon/me-order-undelivery@2x.png", title: gm.me_undelivered, number: 5),
      OrderStatisticsItem(icon: "images/me-icon/me-order-unreceipt@2x.png", title: gm.me_unreceived, number: 5),
      OrderStatisticsItem(icon: "images/me-icon/me-order-after-sale@2x.png", title: gm.me_after_sale, number: 5)
    ];
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((e) => OrderStatisticsWidget(item: e)).toList()
          );
  }
}


class OrderStatisticsWidget extends StatelessWidget {

  final OrderStatisticsItem item;

  OrderStatisticsWidget({Key key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.icon, width: 26, height: 26,),
          SizedBox(height: 4),
          Text(item.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 59, 69, 78)),)
        ],
      ),
    );
  }
}

class OrderStatisticsItem {
  String icon, title;
  int number;
  OrderStatisticsItem({this.icon, this.title, this.number});
}