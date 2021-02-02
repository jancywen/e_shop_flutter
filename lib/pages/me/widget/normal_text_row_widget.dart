import 'package:flutter/material.dart';

class NormalTextRowWidget extends StatelessWidget {

  final String title;
  final String subTitle;
  NormalTextRowWidget({Key key, this.title, this.subTitle});


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 51, 61)),),
        Expanded(child: 
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(
              subTitle, 
              style: TextStyle(
                color: Color.fromARGB(255, 109, 116, 123), 
                fontSize: 13),
              textAlign: TextAlign.right,
              ),
            )
          ),
        Padding(
            padding: EdgeInsets.only(right: 0),
            child: Image.asset("images/indicator.png", width: 8, height: 13),
            ),
      ],
    );
  }
}