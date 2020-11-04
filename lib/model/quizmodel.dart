import 'dart:convert';

import 'package:flutter/services.dart';

class QuizModel {
  final String stimulus;
  final List<QuizOptions> options;

  QuizModel({this.stimulus, this.options});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    var list = json['options'] as List;
    List<QuizOptions> optionsList =
        list.map((i) => QuizOptions.fromJson(i)).toList();

    return QuizModel(stimulus: json["stimulus"], options: optionsList);
  }
}

class QuizOptions {
  final List<dynamic> feedback;
  final String score;
  final String label;
  final dynamic media;
  final int value;
  final int isCorrect;

  QuizOptions(
      {this.feedback,
      this.score,
      this.label,
      this.media,
      this.value,
      this.isCorrect});

  factory QuizOptions.fromJson(Map<String, dynamic> json) {
    return QuizOptions(
        feedback: List<dynamic>.from(json["feedback"].map((x) => x)),
        score: json['score'].toString(),
        label: json['label'].toString(),
        media: json['media'],
        value: json['value'],
        isCorrect: json['isCorrect']);
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
