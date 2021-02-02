import 'package:flutter/material.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:e_shop_flutter/util/image_util.dart';
import 'package:e_shop_flutter/generated/l10n.dart';

class MeUserInfoWidget extends StatelessWidget {

  final User user;
  final VoidCallback tapUserInfo;

  MeUserInfoWidget({Key key, this.user, this.tapUserInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapUserInfo,
      child: Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        height: 78,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color.fromARGB(255, 238, 238, 238), width: 1))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
            child: user == null 
            ? Image.asset("images/me-icon/me-avatar@2x.png") 
            : ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: EchainImage(
                url: "user", 
                placeholder: "images/me-icon/me-avatar@2x.png",
                height: 54, 
                width: 54)
            ),
            ),
          Expanded(child: 
            Text(
              user == null ? S.of(context).me_loginSignup : user.nickname ?? "", 
              style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold 
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Image.asset("images/indicator.png", width: 8, height: 13),
            ),
        ],),
        )
    );
  }
}