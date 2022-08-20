import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appThemeRepositoryProvider =
    Provider.autoDispose(((_) => AppThemeRepository()));

class AppThemeRepository {
  Future<void> setIsDeviceValue(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDevice', value);
  }

  Future<bool> getIsDeviceValue() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('isDevice');
    return value ?? true;
  }

  Future<void> setIsDarkValue(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
  }

  Future<bool> getIsDarkValue() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('isDark');
    return value ?? false;
  }
}
