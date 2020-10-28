import 'package:quizzy/network/networking.dart';

class QuizBank {

  Future<dynamic> getQuestionData() async {

    String url = 'https://github.com/tataclassedge/demo-app/blob/main/assign1/question1.json';
    NetworkHelper networkHelper = NetworkHelper(url);
    var quizData = await networkHelper.getQuestionData();

    return quizData;
  }

}