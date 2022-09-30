import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/infra/repository/app_theme_repository.dart';
import 'package:gethub/notifier/app_theme_state.dart';

final appThemeNotifierProvicer =
    StateNotifierProvider<AppThemeNotifier, AppThemeState>(
        (ref) => AppThemeNotifier(ref.read(appThemeRepositoryProvider)));

class AppThemeNotifier extends StateNotifier<AppThemeState> {
  AppThemeNotifier(this._repository) : super(const AppThemeState()) {
    _init();
  }
  final AppThemeRepository _repository;

  Future<void> _init() async {
    final isDevice = await _repository.getIsDeviceValue();
    final isDark = await _repository.getIsDarkValue();

    state = state.copyWith(isDevice: isDevice, isDark: isDark);
  }

  void toggleIsDevice() {
    state = state.copyWith(isDevice: !state.isDevice);
    if (state.isDevice) {
      state = state.copyWith(isDark: false);
    }
    _repository.setIsDeviceValue(state.isDevice);
    _repository.setIsDarkValue(state.isDark);
  }

  void toggleIsDark() {
    state = state.copyWith(isDark: !state.isDark);
    if (state.isDark) {
      state = state.copyWith(isDevice: false);
    }
    _repository.setIsDeviceValue(state.isDevice);
    _repository.setIsDarkValue(state.isDark);
  }
}
