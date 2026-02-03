import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData Theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background1,

    primaryColor: AppColors.accent,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background1,
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

  );
}
