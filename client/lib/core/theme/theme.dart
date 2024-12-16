import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border() => OutlineInputBorder(
        borderSide: BorderSide(color: Pallete.borderColor, width: 3),
        borderRadius: BorderRadius.circular(12.0),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );
}
