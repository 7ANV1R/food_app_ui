import 'package:flutter/material.dart';
import 'package:food_app/core/theme/const_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppTheme {
  // Light Theme

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: kWhiteColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      hintStyle: GoogleFonts.outfit(
        color: kDarkGreyColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: kLightGreyColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
