import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quizzy/bloc/bloc.dart';
import 'package:quizzy/model/quizmodel.dart';

class QuizDataQueryBloc extends Bloc {
  final _controller = StreamController<QuizModel>();

  Stream<QuizModel> get quizStream => _controller.stream;

  void submitQuery() async {
    String jsonString = await rootBundle.loadString('assets/quizdata.json');
    final jsonResponse = json.decode(jsonString);
    _controller.sink.add(QuizModel.fromJson(jsonResponse[0]["data"]));
  }

  @override
  void dispose() {
    _controller.close();
  }
}
