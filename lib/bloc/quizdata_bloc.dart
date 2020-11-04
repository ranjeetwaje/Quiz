import 'dart:async';

import 'package:quizzy/bloc/bloc.dart';
import 'package:quizzy/model/quizmodel.dart';

class QuizDataBloc implements Bloc {
  QuizModel _quizModel;
  QuizModel get quizData => _quizModel;

  final _quizController = StreamController<QuizModel>();

  Stream<QuizModel> get quizStream => _quizController.stream;

  void getQuizData(QuizModel quizModel) {
    _quizModel = quizModel;
    _quizController.sink.add(quizModel);
  }

  @override
  void dispose() {
    _quizController.close();
  }
}
