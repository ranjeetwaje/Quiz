import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/bloc/quizdata_query_bloc.dart';
import 'package:quizzy/components/icon_content.dart';
import 'package:quizzy/components/reusable_card.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/model/quizmodel.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz_screen';

  final QuizDataQueryBloc bloc;
  const QuizScreen({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.quizStream,
        builder: (context, snapshot) {
          final result = snapshot.data;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _question(result, context),
                _options(result, _animation),
              ],
            ),
          );
        });
  }
}

Widget _question(QuizModel model, BuildContext context) {
  CountDownController _countDownController = CountDownController();
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
    child: Container(
      height: 400.0,
      child: Column(
        children: [
          Text(
            'Oh! My Quiz',
            style: kButtonTextStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            model.stimulus,
            textAlign: TextAlign.center,
            style: kButtonTextStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
          CircularCountDownTimer(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 4,
            duration: 10,
            fillColor: Colors.white,
            color: Colors.red,
            controller: _countDownController,
            textStyle: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            onComplete: () {},
          )
        ],
      ),
    ),
  );
}

Widget _options(QuizModel model, Animation<double> animation) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ScaleTransition(
                  scale: animation,
                  child: ReusableCard(
                    color: Colors.white,
                    childCard: IconContent(
                      label: 'A',
                      title: model.options[0].label,
                      circleBgColor: Colors.yellowAccent,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                child: ScaleTransition(
                  scale: animation,
                  child: ReusableCard(
                    color: Colors.white,
                    childCard: IconContent(
                      label: 'B',
                      title: model.options[1].label,
                      circleBgColor: Colors.lightBlueAccent,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ScaleTransition(
                  scale: animation,
                  child: ReusableCard(
                    color: Colors.white,
                    childCard: IconContent(
                      label: 'C',
                      title: model.options[2].label,
                      circleBgColor: Colors.deepOrangeAccent,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                child: ScaleTransition(
                  scale: animation,
                  child: ReusableCard(
                    color: Colors.white,
                    childCard: IconContent(
                      label: 'D',
                      title: model.options[3].label,
                      circleBgColor: Colors.deepPurpleAccent,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/*
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
    print("Options ${quizModel.options}");
    option1 = stringFormatter(quizModel.options.label);
    option2 = stringFormatter(quizModel.options.label);
    option3 = stringFormatter(quizModel.options.label);
    option4 = stringFormatter(quizModel.options.label);
  }

  String stringFormatter(String value) {
    return value.replaceAll(new RegExp(r'[<p></p>]+'), '');
  }

  FutureOr onGoBack(dynamic value) {
    getQuizData();
    _countDownController.restart();
    setState(() {});
  }

  void isCorrect(int answer) {
    setState(() {
      if (quizModel.options.isCorrect == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              resultText: "Correct Answer",
              option: "$answer",
            ),
          ),
        ).then(onGoBack);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              resultText: "Wrong Answer",
              option: "$answer",
            ),
          ),
        ).then(onGoBack);
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
}
*/
