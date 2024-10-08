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
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notesCollection.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  //@ UPDATE: update notes given a doc id
  Future<void> updateNote(String docId, String newNote) {
    return notesCollection.doc(docId).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //@ DELETE: delete notes given a doc id
  Future<void> deleteNote(String docId) {
    return notesCollection.doc(docId).delete();
  }
}
