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
  void openNoteBox() {
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
                      //! add a new note
                      // print(noteController.text);
                      friestoreServices.addNote(noteController.text);

                      // clear the text controller
                      noteController.clear();

                      // close the box
                      Navigator.pop(context);
                    },
                    child: Text('Save')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
