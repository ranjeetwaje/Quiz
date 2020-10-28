import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {

  final String title;
  final double noteTime;

  NoteTile({this.title, this.noteTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text('$noteTime'),
    );
  }
}