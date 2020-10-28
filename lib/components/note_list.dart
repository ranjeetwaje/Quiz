
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/components/note_tile.dart';
import 'package:quizzy/model/note.dart';

class NoteList extends StatefulWidget {

  final List<Note> notes;

  NoteList({this.notes});

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return NoteTile(
        title: widget.notes[index].note,
        noteTime: widget.notes[index].timerPosition,
      );
    }, itemCount: widget.notes.length,);
  }
}