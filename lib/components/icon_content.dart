import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {

  final String label;
  final String title;

  IconContent({@required this.label, @required this.title});

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
          backgroundColor: Colors.white,
          radius: 30.0,
        ),
        SizedBox(height: 10.0,),
        Text(title,
          style: kButtonTextStyle,
        )
      ],
    );
  }
}