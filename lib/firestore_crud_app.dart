import 'package:flutter/material.dart';

import 'pages/pages.dart';

class FirestoreCRUDApp extends StatelessWidget {
  const FirestoreCRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
