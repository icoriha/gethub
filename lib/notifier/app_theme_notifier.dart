import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gethub/domain/model/app_theme.dart';
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
    state = state.copyWith(isLoading: true);
    final isDevice = await _repository.getIsDeviceValue();
    final isDark = await _repository.getIsDarkValue();

    state = state.copyWith(
      isDevice: isDevice,
      isDark: isDark,
      isLoading: false,
    );
  }

  void _toggleDeviceOrNot() {
    state = state.copyWith(isDevice: !state.isDevice);
    if (state.isDevice) {
      state = state.copyWith(isDark: false);
    }
    _repository.setIsDeviceValue(state.isDevice);
  }

  void _toggleDarkOrLight() {
    state = state.copyWith(isDark: !state.isDark);
    if (state.isDark) {
      state = state.copyWith(isDevice: false);
    }
    _repository.setIsDarkValue(state.isDark);
  }

  AppTheme _currentTheme() {
    if (state.isDevice) return AppTheme.device;
    if (state.isDark) return AppTheme.dark;
    return AppTheme.light;
  }

  AppTheme get currentTheme => _currentTheme();
}
