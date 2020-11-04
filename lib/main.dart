import 'package:flutter/material.dart';
import 'package:quizzy/bloc/bloc_provider.dart';
import 'package:quizzy/bloc/quiz_answer_bloc.dart';
import 'package:quizzy/bloc/quizdata_bloc.dart';
import 'package:quizzy/screens/home_screen.dart';

import 'bloc/quizdata_query_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizDataQueryBloc>(
      bloc: QuizDataQueryBloc(),
      child: BlocProvider<QuizAnswerBloc>(
        bloc: QuizAnswerBloc(),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF7E3FE5),
            scaffoldBackgroundColor: Color(0xFF6F3FE5),
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
