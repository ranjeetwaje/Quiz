
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/components/note_tile.dart';
import 'package:quizzy/model/note_data.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final note = noteData.notes[index];
            return NoteTile(
              taskTitle: note.note,
              noteTime: note.timerPosition,
            );
          }
        );
      },
    );
  }
}