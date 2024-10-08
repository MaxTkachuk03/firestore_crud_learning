import 'package:cloud_firestore/cloud_firestore.dart';

class FriestoreServices {
  //@ get collection of notes
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  //@ CREATE: add a new note
  Future<void> addNote(String note) async {
    try {
      await notesCollection.add({
        'note': note,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      Exception('Error adding note: $e');
    }
  }

  //@ READ: get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notesCollection.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  //@ UPDATE: update notes given a doc id
  Future<void> updateNote(String docId, String newNote) async {
    try {
      await notesCollection.doc(docId).update({
        'note': newNote,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      Exception('Error updating note: $e');
    }
  }

  //@ DELETE: delete notes given a doc id
  Future<void> deleteNote(String docId) async {
    await notesCollection.doc(docId).delete();
  }
}
