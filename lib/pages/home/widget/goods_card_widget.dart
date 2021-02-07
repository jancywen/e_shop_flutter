
import 'package:flutter/material.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop_flutter/util/image_util.dart';

class GoodsCardWidget extends StatelessWidget {

  final GoodsModel model;
  final Function onTap;
  GoodsCardWidget({Key key, this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            EchainImage(
              url: model.mainImg, 
              height: ScreenUtil().setHeight(172), 
              width: (ScreenUtil().screenWidth - 42)/2,
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 12.h, left: 10, right: 10),
              child: Text(
                model.name,
                style: Theme.of(context).textTheme.headline2, 
                maxLines: 2,),
              ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${model.saleCountrys["currency"]} ${model.saleCountrys["price"]}", 
                    style: Theme.of(context).textTheme.headline4,
                    ),
                  Text(model.sanCode)
                  ],
                )
              )

          ]
        )
      )
    );
  }
}