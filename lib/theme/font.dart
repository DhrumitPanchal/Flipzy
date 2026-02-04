import 'package:flutter/material.dart';
import 'package:Flipzy/theme/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static const TextStyle headingXL = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: "JungleAdventurer",
    letterSpacing: 1
  );

  static const TextStyle headingL = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
      fontFamily: "JungleAdventurer"

  );

  // Body
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
      fontFamily: "JungleAdventurer"

  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
      fontFamily: "JungleAdventurer"

  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  // Card content (emoji / icon)
  static const TextStyle cardValue = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
}
