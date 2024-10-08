//$ open a dialog vox to add a note
import 'package:firestore_crud_learning/generated/l10n.dart';
import 'package:firestore_crud_learning/resources/resources.dart';
import 'package:firestore_crud_learning/resources/styles.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';

void openNoteBox({
  required BuildContext context,
  required TextEditingController noteController,
  String? docId,
  required FriestoreServices friestoreServices,
}) {
  noteController.clear();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: TextField(
                minLines: 1,
                maxLines: 50,
                style: AppStyles.writeStyle,
                controller: noteController,
                decoration: InputDecoration(
                  hintText: S.of(context).enterNote,
                  hintStyle: AppStyles.hintTextStyle,
                )),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              // button to save
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.inversePrimary,
                  )),
                  onPressed: () {
                    if (noteController.text.trim().isEmpty) {
                      Navigator.pop(context);
                      return;
                    }
                    //! add a new note or edit old note
                    if (docId == null) {
                      friestoreServices.addNote(noteController.text);
                    } else {
                      friestoreServices.updateNote(docId, noteController.text);
                    }

                    // clear the text controller
                    noteController.clear();

                    // close the box
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).buttonSave)),
            ],
          ));
}
