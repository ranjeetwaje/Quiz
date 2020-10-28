import 'dart:convert';

import 'package:flutter/services.dart';

class QuizModel {
  String stimulus;
  List<dynamic> options;

  QuizModel({this.stimulus, this.options});

  Map<String, dynamic> toJson() => {
    "stimulus": stimulus,
    "options": List<dynamic>.from(options.map((x) => x)),
  };

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
        stimulus: json["stimulus"],
        options: List<dynamic>.from(json["options"].map((x) => x))
        );
  }
}

Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/quizdata.json');
}

Future<QuizModel> loadQuiz() async {
  String jsonString = await _loadAsset();
  final jsonResponse = json.decode(jsonString);
  return new QuizModel.fromJson(jsonResponse[0]["data"]);
}