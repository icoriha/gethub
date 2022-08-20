import 'package:flutter/material.dart';
import 'package:gethub/foundation/app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      background: AppColors.lightBackGround,
    ),
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        overflow: TextOverflow.ellipsis,
      ), // For repository name
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimary.withOpacity(0.8),
        overflow: TextOverflow.ellipsis,
      ), // For project language
      headline3: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ), // For count label
      headline4: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ), // For count value
      bodyText1: const TextStyle(
        color: Colors.black87,
        overflow: TextOverflow.ellipsis,
      ), // For error or no result explanations
    ),
  );

  static ThemeData dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      background: AppColors.darkBackGround,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ), // For repository name
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.darkPrimary,
        overflow: TextOverflow.ellipsis,
      ), // For project language
      headline3: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ), // For count label
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ), // For count value
      bodyText1: TextStyle(
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ), // For error or no result explanations
    ),
  );
}
