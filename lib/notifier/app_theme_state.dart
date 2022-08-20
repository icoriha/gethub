import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_state.freezed.dart';

@freezed
class AppThemeState with _$AppThemeState {
  const factory AppThemeState({
    @Default(true) bool isDevice,
    @Default(false) bool isDark,
  }) = _AppThemeState;
}
