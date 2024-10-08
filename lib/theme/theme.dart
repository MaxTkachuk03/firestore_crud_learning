import 'package:firestore_crud_learning/resources/resources.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: AppColors.surface,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    inversePrimary: AppColors.inversePrimary,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.bodyColor,
        displayColor: AppColors.displayColor,
      ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.surfaceDark,
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryDark,
    inversePrimary: AppColors.inversePrimaryDark,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: AppColors.bodyColorDark,
        displayColor: AppColors.displayColorDark,
      ),
);
