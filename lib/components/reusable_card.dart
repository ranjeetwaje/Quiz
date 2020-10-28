import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget childCard;
  final Function onTap;

  ReusableCard({@required this.color, this.childCard, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}