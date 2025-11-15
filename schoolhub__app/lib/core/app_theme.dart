import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color lightGreen = Color(0xFFC8E6C9);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color white = Colors.white;
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkGreen,
    primary: AppColors.darkGreen,
    secondary: AppColors.lightGreen,
  ),
  textTheme: TextTheme(
    // Remplace headline1 par displayLarge
    displayLarge:
        GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w700),
    // Remplace headline6 par titleLarge
    titleLarge: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
    // Remplace bodyText1 par bodyLarge
    bodyLarge: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),
    // Remplace bodyText2 par bodyMedium
    bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkGreen,
      foregroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
);
