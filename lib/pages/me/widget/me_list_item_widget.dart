import 'package:flutter/material.dart';
import 'normal_text_row_widget.dart';
import 'package:e_shop_flutter/generated/l10n.dart';

class MeListItemWidget extends StatelessWidget {

  final MeMainItemType item;
  MeListItemWidget({Key key, this.item});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    
    String icon, title, subTitle;

    switch (item) {
      case MeMainItemType.about:
        icon = "images/me-icon/me-about@2x.png";
        title = s.me_about;
        subTitle = "";
        break;
      case MeMainItemType.setting:
        icon = "images/me-icon/me-setting@2x.png";
        title = s.me_setting;
        subTitle = "";
        break;
      default:
        icon = "";
        title = "";
        subTitle = "";
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15),
      height: 52,
      padding: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          border: 
            item == MeMainItemType.setting 
            ? Border() 
            : Border(bottom: BorderSide(color: Color.fromARGB(255, 238, 238, 238), width: 1))
        ),
      child: Row(
        children: [
          Image.asset(icon, width: 17, height: 17),
          SizedBox(width: 15),
          Expanded(child: 
            NormalTextRowWidget(title: title, subTitle: subTitle,)
          )
        ],
      ),
    );
  }
}

enum MeMainItemType {
  about,
  setting,
  wallet,
  shop,
  invite,
}