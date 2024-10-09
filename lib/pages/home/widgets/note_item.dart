import 'package:firestore_crud_learning/resources/resources.dart';
import 'package:firestore_crud_learning/services/services.dart';
import 'package:firestore_crud_learning/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteText,
    required this.docId,
    required this.friestoreServices,
    required this.noteController,
  });

  final String noteText;
  final String docId;
  final FriestoreServices friestoreServices;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListTile(
          title: Text(
            noteText,
            style: AppStyles.writeStyle,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //$ update note
              MyIconButton(
                icon: AppIcons.editIcon,
                onPressed: () => openNoteBox(
                    context: context,
                    docId: docId,
                    friestoreServices: friestoreServices,
                    noteController: noteController),
              ),

              //$ delete note
              MyIconButton(
                icon: AppIcons.deleteIcon,
                onPressed: () => friestoreServices.deleteNote(docId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
