import 'package:flutter/material.dart';
import 'package:quizzy/screens/home_screen.dart';
import 'package:quizzy/screens/quiz_screen.dart';
import 'package:quizzy/screens/result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF7E3FE5),
        scaffoldBackgroundColor: Color(0xFF6F3FE5),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        QuizScreen.id: (context) => QuizScreen(),
        ResultScreen.id: (context) => ResultScreen(),
      },
    );
  }
}
