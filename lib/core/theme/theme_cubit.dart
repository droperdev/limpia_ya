import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limpio_ya/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final SharedPreferences sharedPreferences;

  ThemeCubit(this.sharedPreferences) : super(AppTheme.light) {
    _loadTheme();
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    final theme = _isDarkMode ? AppTheme.dark : AppTheme.light;
    emit(theme);
    _saveTheme();
  }

  void _loadTheme() {
    _isDarkMode = sharedPreferences.getBool('isDarkMode') ?? false;
    emit(_isDarkMode ? AppTheme.dark : AppTheme.light);
  }

  void _saveTheme() {
    sharedPreferences.setBool('isDarkMode', _isDarkMode);
  }
}
