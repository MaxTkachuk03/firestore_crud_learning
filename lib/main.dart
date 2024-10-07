import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud_learning/firebase_options.dart';
import 'package:firestore_crud_learning/firestore_crud_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FirestoreCRUDApp());
}
