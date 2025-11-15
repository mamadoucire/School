import 'package:flutter/material.dart';

class AppColors {
  // Couleurs principales
  static const Color primary = Color(0xFF2E7D32); // Dark green
  static const Color accent = Color(0xFFC8E6C9); // Light green
  
  // Dégradés pour headers
  static const Color darkBlue = Color(0xFF1A237E); // Bleu foncé
  static const Color purple = Color(0xFF6A1B9A); // Violet
  static const Color lightPurple = Color(0xFF9C27B0); // Violet clair
  
  // Couleurs UI
  static const Color surface = Colors.white;
  static const Color background = Color(0xFFF5F7FA);
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Colors.white;
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color greyText = Color(0xFF9E9E9E);
  
  // Couleurs pour les notes
  static const Color noteGreen = Color(0xFF4CAF50);
  static const Color notePurple = Color(0xFF9C27B0);
  static const Color noteOrange = Color(0xFFFF9800);
  static const Color noteBlue = Color(0xFF2196F3);
  static const Color noteRed = Color(0xFFF44336);
}

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String childDetail = '/child/:id';
  static const String bulletin = '/bulletin';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
}

