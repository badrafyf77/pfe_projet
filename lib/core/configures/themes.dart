import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kLightSecondColor,
    primaryColor: AppColors.kLightPrimaryColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kLightPrimaryColor,
      secondary: AppColors.kLightSecondColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kLightPrimaryColor,
      elevation: 0.0,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kDarkSecondColor,
    primaryColor: AppColors.kDarkPrimaryColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.kDarkPrimaryColor,
      secondary: AppColors.kDarkSecondColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kDarkPrimaryColor,
      elevation: 0.0,
    ),
  );

  static ThemeData themeData(bool isDarkTheme) {
    if (isDarkTheme) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}
