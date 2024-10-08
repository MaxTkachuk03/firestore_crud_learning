import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud_learning/generated/l10n.dart';
import 'package:firestore_crud_learning/provider/theme_provider.dart';
import 'package:firestore_crud_learning/resources/icons.dart';
import 'package:firestore_crud_learning/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/services.dart';
import '../../../widgets/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: MyAppBar(
          onPressed: () => themeProvider.toggleTheme(),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: friestoreServices.getNotesStream(),
            builder: (context, snapshot) {
              //@ if we have data, get all the docs
              if (snapshot.hasData) {
                List notesList = snapshot.data!.docs;

                //@ display as a list
                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16.0, bottom: 36.0),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
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
                                  onPressed: () =>
                                      friestoreServices.deleteNote(docId),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              //@ if no notes return nothing
              else {
                return Text(S.of(context).emptyBox);
              }
            }),
        floatingActionButton: MyFloatButton(
          onPressed: () => openNoteBox(
              context: context,
              friestoreServices: friestoreServices,
              noteController: noteController),
          child: AppIcons.addIcon,
        ),
      );
    });
  }
}
