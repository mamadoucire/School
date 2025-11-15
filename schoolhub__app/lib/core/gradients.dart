import 'package:flutter/material.dart';
import 'constants.dart';

class AppGradients {
  // Dégradé bleu foncé vers violet pour les headers
  static const LinearGradient darkHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.darkBlue,
      AppColors.purple,
    ],
  );

  // Dégradé violet clair vers blanc pour certains headers
  static const LinearGradient lightHeaderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE1BEE7),
      Colors.white,
    ],
  );
}

