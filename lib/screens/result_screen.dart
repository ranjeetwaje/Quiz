import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/components/icon_content.dart';
import 'package:quizzy/components/reusable_card.dart';

import '../constants.dart';

class ResultScreen extends StatefulWidget {
  final String resultText;
  final String option;

  ResultScreen({@required this.resultText, @required this.option});
  static const String id = "result_screen";
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            Navigator.pop(context);
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    String getSelectedOption() {
      print(widget.option);
      if (widget.option == "0") {
        return "A";
      } else if (widget.option == "1") {
        return "B";
      } else if (widget.option == "2") {
        return "C";
      } else if (widget.option == "3") {
        return "D";
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.0,
            width: 200.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: ReusableCard(
                color: kBottomContainerColor,
                childCard: IconContent(
                  label: getSelectedOption(),
                  title: widget.resultText,
                  circleBgColor: Colors.yellowAccent,
                ),
                onTap: () {},
              ),
            ),
          ),
          Container(
            height: 200.0,
            width: 200.0,
          ),
        ],
      ),
    );
  }
}
