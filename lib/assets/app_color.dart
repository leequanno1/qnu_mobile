import 'package:flutter/material.dart';

class AppColors {
  // Prevent instantiation
  const AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF007AFF);
  static const Color secondary = Color(0xFFD9D9D9);
  static const Color background = Color(0xFFFBFBFB);
  
  // Semantic Colors
  static const Color error = Color(0xFFFF0000);
  static const Color success = Color(0xFF007AFF);
  static const Color warning = Color.fromARGB(255, 255, 193, 7);
  static const Color info = Color(0xFF17A2B8);
  
  // Neutral Colors
  static const Color outline = Color(0xFF7C8EA9);
  static const Color articalBackground = Color(0xFFF1F1F1);
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color disableButton = Color.fromARGB(255, 102, 94, 94);
  static const Color link = Color(0xFF7C8EA9);
  static const Color textRed = Color.fromARGB(178, 230, 0, 0);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    secondary: secondary,
    error: error,
    surface: lightSurface,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: Colors.white,
    onSurface: secondary,
  );

  // Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    secondary: secondary,
    error: error,
    surface: darkSurface,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: Colors.white,
    onSurface: Colors.white,
  );
}