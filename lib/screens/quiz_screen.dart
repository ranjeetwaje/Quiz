import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/components/icon_content.dart';
import 'package:quizzy/components/reusable_card.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import '../constants.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz_screen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0, bottom: 10.0),
              child: Container(
                height: 400.0,
                child: Column(
                  children: [
                    Text(
                      'Oh! My Quiz',
                      style: kButtonTextStyle,
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Your Question is',
                      style: kResultTitleTextStyle,
                    ),
                    SizedBox(height: 20.0,),
                    CircularCountDownTimer(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                      duration: 10,
                      fillColor: Colors.white,
                      color: Colors.red,
                      controller: _countDownController,
                      textStyle: TextStyle(
                          fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
                      onComplete: () {},
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      childCard: IconContent(label: 'A', title: 'Option 1',),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      childCard: IconContent(label: 'B', title: 'Option 2'),
                      onTap: () {
                        setState(() {

                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      childCard: IconContent(label: 'C', title: 'Option 3'),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      childCard: IconContent(label: 'D', title: 'Option 4'),
                      onTap: () {
                        setState(() {

                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
