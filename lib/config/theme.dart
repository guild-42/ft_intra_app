import 'package:flutter/material.dart';

class FtTheme {
  FtTheme._();

  static const _teal = Color(0xFF00BABC);
  static const _dark = Color(0xFF1E1E2E);
  static const _darkSurface = Color(0xFF2A2A3E);
  static const _darkCard = Color(0xFF313145);

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: _teal,
          secondary: _teal,
          surface: _darkSurface,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: _dark,
        cardTheme: const CardThemeData(
          color: _darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: _dark,
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _darkSurface,
          selectedItemColor: _teal,
          unselectedItemColor: Colors.grey,
        ),
      );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: _teal,
          secondary: _teal,
        ),
        cardTheme: const CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      );
}
