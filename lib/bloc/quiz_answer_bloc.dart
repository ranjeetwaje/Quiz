import 'dart:async';

import 'package:quizzy/bloc/bloc.dart';
import 'package:quizzy/model/quizmodel.dart';

class QuizAnswerBloc extends Bloc {

  var _options = QuizOptions();
  QuizOptions get quizOptions => _options;

  final _controller = StreamController<QuizOptions>.broadcast();

  Stream<QuizOptions> get quizAnswerStream => _controller.stream;

  void answerQuery(QuizOptions options) {
    _controller.sink.add(options);
  }

  @override
  void dispose() {
    _controller.close();
  }

}