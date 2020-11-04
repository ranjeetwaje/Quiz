import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/bloc/bloc_provider.dart';
import 'package:quizzy/bloc/quizdata_query_bloc.dart';
import 'package:quizzy/components/note_list.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/model/note.dart';
import 'package:quizzy/screens/quiz_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [
    Note(note: 'Note 1', timerPosition: 0.3),
    Note(note: 'Note 2', timerPosition: 0.3)
  ];

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    // _videoPlayerController = VideoPlayerController.asset('videos/smart-farmer.mp4');
    _videoPlayerController = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  _onAlertWithCustomContentPressed(context, int noteTime) {
    String note;
    Alert(
        context: context,
        title: "Create Note",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: 'Add note here!',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (newValue) {
                note = newValue;
              },
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              notes.add(Note(note: note, timerPosition: noteTime.toDouble()));
              Navigator.pop(context);
              _chewieController.play();
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = QuizDataQueryBloc();
    return BlocProvider<QuizDataQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  Container(
                    height: 50.0,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: FlatButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              setState(() {
                                _chewieController.pause();
                                int seconds = _chewieController
                                    .videoPlayerController
                                    .value
                                    .position
                                    .inSeconds;
                                _onAlertWithCustomContentPressed(
                                    context, seconds);
                              });
                            },
                            child: Text(
                              'Add Note',
                              style: kLabelTextStyle,
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: FlatButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              _chewieController.pause();
                              bloc.submitQuery();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      QuizScreen(bloc: bloc)));
                            },
                            child: Text(
                              'Start Quiz',
                              style: kLabelTextStyle,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Expanded(
                      child: NoteList(
                        notes: notes,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
