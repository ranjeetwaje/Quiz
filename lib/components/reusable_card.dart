import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

/*
class ReusableCard extends AnimatedWidget {

  final Color color;
  final Widget childCard;
  final Function onTap;
  // ReusableCard({@required this.color, this.childCard, this.onTap, this.controller});
  const ReusableCard({this.color, this.childCard, this.onTap, Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: childCard,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
*/

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