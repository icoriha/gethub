import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/notifier/app_theme_notifier.dart';

final isDarkProvider = Provider.autoDispose.family<bool, Brightness>((ref, brightness) {
  final appTheme = ref.watch(appThemeNotifierProvicer);
  final isDevice = appTheme.isDevice;
  final isDark = appTheme.isDark;

  final deviceModeIsDark = brightness == Brightness.dark;

  return (!isDevice && isDark) || (isDevice && deviceModeIsDark);
});
