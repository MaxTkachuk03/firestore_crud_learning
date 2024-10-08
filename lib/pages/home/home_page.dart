import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //@ firestore
  final friestoreServices = FriestoreServices();

  //$ text controller
  final TextEditingController noteController = TextEditingController();

  //$ open a dialog vox to add a note
  void openNoteBox({String? docId}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: noteController,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                // button to save
                ElevatedButton(
                    onPressed: () {
                      //! add a new note or edit old note
                      if (docId == null) {
                        friestoreServices.addNote(noteController.text);
                      } else {
                        friestoreServices.updateNote(
                            docId, noteController.text);
                      }

                      // clear the text controller
                      noteController.clear();

                      // close the box
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: friestoreServices.getNotesStream(),
          builder: (context, snapshot) {
            //@ if we have data, get all the docs
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              //@ display as a list
              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    // get each individual doc
                    DocumentSnapshot document = notesList[index];
                    String docId = document.id;

                    //@ get note from each doc
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];

                    //@ display a list tile
                    return ListTile(
                      title: Text(noteText),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //$ update note
                          IconButton.outlined(
                              onPressed: () => openNoteBox(docId: docId),
                              icon: const Icon(Icons.edit)),

                          //$ delete note
                          IconButton.outlined(
                              onPressed: () =>
                                  friestoreServices.deleteNote(docId),
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    );
                  });
            }
            //@ if no notes return nothing
            else {
              return const Text('No notes...');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
