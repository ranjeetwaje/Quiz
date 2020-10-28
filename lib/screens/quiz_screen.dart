import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/components/icon_content.dart';
import 'package:quizzy/components/reusable_card.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:quizzy/model/quizmodel.dart';
import 'package:quizzy/screens/result_screen.dart';

import '../constants.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz_screen';
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CountDownController _countDownController = CountDownController();

  QuizModel quizModel;

  String question;
  String option1;
  String option2;
  String option3;
  String option4;

  Future<QuizModel> getQuizData() async {
    // var quizData = await QuizBank().getQuestionData();
    return quizModel = await loadQuiz();
  }

  void loadQuizData(QuizModel quizModel) {
    question = stringFormatter(quizModel.stimulus);
    option1 = stringFormatter(quizModel.options[0]["label"]);
    option2 = stringFormatter(quizModel.options[1]["label"]);
    option3 = stringFormatter(quizModel.options[2]["label"]);
    option4 = stringFormatter(quizModel.options[3]["label"]);
  }

  String stringFormatter(String value) {
    return value.replaceAll(new RegExp(r'[<p></p>]+'),'');
  }

  FutureOr onGoBack(dynamic value) {
    getQuizData();
    _countDownController.restart();
    setState(() {});
  }

  void isCorrect(int answer) {
    setState(() {
      if (quizModel.options[answer]["isCorrect"] == 1) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ResultScreen(
            resultText: "Correct Answer",
            option: "$answer",
          ),
        ),).then(onGoBack);
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ResultScreen(
            resultText: "Wrong Answer",
            option: "$answer",
          ),
        ),).then(onGoBack);
      }
    });
  }

  @override
  void initState() {
    getQuizData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<QuizModel>(
          future: getQuizData(),
          builder: (BuildContext context, AsyncSnapshot<QuizModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
            if (snapshot.hasData)
              loadQuizData(snapshot.data);
              return Column(
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
                            question = question != null ? question : 'No Question',
                            textAlign: TextAlign.center,
                            style: kButtonTextStyle,
                          ),
                          SizedBox(height: 20.0,),
                          CircularCountDownTimer(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 4,
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
                            childCard: IconContent(label: 'A',
                              title: option1.toString(),
                              circleBgColor: Colors.yellowAccent,
                            ),
                            onTap: (){
                              isCorrect(0);
                            },
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kActiveCardColor,
                            childCard: IconContent(label: 'B',
                              title: option2.toString(),
                              circleBgColor: Colors.lightBlueAccent,
                            ),
                            onTap: () {
                              isCorrect(1);
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
                            childCard: IconContent(label: 'C',
                              title: option3.toString(),
                              circleBgColor: Colors.greenAccent,
                            ),
                            onTap: (){
                              isCorrect(2);
                            },
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kActiveCardColor,
                            childCard: IconContent(label: 'D',
                              title: option4.toString(),
                              circleBgColor: Colors.orangeAccent,
                            ),
                            onTap: () {
                              isCorrect(3);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
