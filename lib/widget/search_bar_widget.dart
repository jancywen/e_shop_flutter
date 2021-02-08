import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop_flutter/generated/l10n.dart';


class SearchBarWidget extends StatelessWidget {
  final Function onTap;
  SearchBarWidget({Key key, this.onTap});
  
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(15, ScreenUtil().statusBarHeight + 8, 15, 9),
      color: Theme.of(context).primaryColor,
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 9, 7, 9),
                child: Image.asset("images/search.png", width:15, height: 15),
                ),
              Text(S.of(context).home_search, style: Theme.of(context).textTheme.headline3,)
            ],
          )
          ),
        ),

    );
  }
}