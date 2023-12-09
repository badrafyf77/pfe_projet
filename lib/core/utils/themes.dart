import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.allertaTextTheme(
      ThemeData().textTheme,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.allertaTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}
