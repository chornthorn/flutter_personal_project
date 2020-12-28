import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

/// Type of theme
enum AppTheme { DARK, LIGHT }

/// Global variable access
final ThemeData light = new ThemeData.light();
final ThemeData dark = new ThemeData.dark();

/// Theme data that provide to main app
final appThemeData = {
  /// light theme
  AppTheme.LIGHT: lightTheme,
  /// dark theme
  AppTheme.DARK: darkTheme,
};

/// text theme
TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}
