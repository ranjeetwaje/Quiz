import 'dart:ffi';

import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/components/note_list.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/model/note_data.dart';
import 'package:quizzy/screens/quiz_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class HomeScreen extends StatefulWidget {

  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.NETWORK,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
    _betterPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _betterPlayerController,
              ),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0),
                          child: FlatButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              setState(() {
                                if (_betterPlayerController.isPlaying() !=
                                    null) {
                                  _betterPlayerController.pause();
                                }
                                _onAlertWithCustomContentPressed(context);
                              });
                            },
                            child: Text(
                              'Add Note',
                              style: kLabelTextStyle,
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child:
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0),
                          child: FlatButton(
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              setState(() async {
                                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizScreen()));
                              });
                            },
                            child: Text(
                              'Start Quiz',
                              style: kLabelTextStyle,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Column(
                  children: [
                    // NoteList()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

_onAlertWithCustomContentPressed(context) {
  Alert(
      context: context,
      title: "Create Note",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Add note here!',
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
