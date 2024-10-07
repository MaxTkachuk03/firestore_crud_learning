import 'package:cloud_firestore/cloud_firestore.dart';

class FriestoreServices {
  //@ get collection of notes
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  //@ CREATE: add a new note
  Future<void> addNote(String note) {
    return notesCollection.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //@ READ: get notes from database

  //@ UPDATE: update notes given a doc id

  //@ DELETE: delete notes given a doc id
}
