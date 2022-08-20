import 'package:flutter/material.dart';
import 'package:gethub/foundation/app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.backGround,
    ),
  );

  static ThemeData dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      background: AppColors.darkBackGround,
    ),
  );
}
