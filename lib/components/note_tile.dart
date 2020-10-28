import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final double noteTime;
  final String taskTitle;

  NoteTile(
      {this.taskTitle,
        this.noteTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
      ),
      trailing: Text(
        '$noteTime'
      ),
    );
  }
}