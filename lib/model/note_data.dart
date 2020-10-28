import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:quizzy/model/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> _notes = [
    Note(note: 'Buy milk', timerPosition: 0.15),
  ];

  UnmodifiableListView<Note> get notes {
    return UnmodifiableListView(_notes);
  }

  int get noteCount {
    return _notes.length;
  }

  void addNote(String title, double timer) {
    final note = Note(note: title, timerPosition: timer);
    _notes.add(note);
    notifyListeners();
  }
}