import 'package:firestore_crud_learning/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme = false;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;
}
