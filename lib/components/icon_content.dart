import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {

  final String label;
  final String title;
  final Color circleBgColor;

  IconContent({@required this.label, @required this.title, this.circleBgColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Text(
            label,
            style: kLabelTextStyle,
          ),
          backgroundColor: circleBgColor,
          radius: 15.0,
        ),
        SizedBox(height: 10.0,),
        Text(title,
          style: kLabelTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}