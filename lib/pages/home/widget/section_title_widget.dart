import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  SectionTitleWidget({Key key, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: 
          Padding(
            padding: EdgeInsets.only(left: 15, top: 12, bottom: 15), 
            child: Text(
              title, 
              style: Theme.of(context).textTheme.headline1),
          ));
  }
}