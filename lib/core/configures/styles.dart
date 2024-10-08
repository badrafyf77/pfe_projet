import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class Styles {
  static const basicStyle = TextStyle(
    color: AppColors.kThirdColor,
    fontWeight: FontWeight.normal,
  );

  static final titleStyle22 = GoogleFonts.comfortaa(
    textStyle: basicStyle.copyWith(
      fontSize: 22,
    ),
  );
  static final normal27 = basicStyle.copyWith(
    fontSize: 27,
  );
  static final normal24 = basicStyle.copyWith(
    fontSize: 24,
  );
  static final normal20 = basicStyle.copyWith(
    fontSize: 20,
  );
  static final normal18 = basicStyle.copyWith(
    fontSize: 18,
  );
  static final normal16 = basicStyle.copyWith(
    fontSize: 16,
  );
  static final normal15 = basicStyle.copyWith(
    fontSize: 15,
  );
  static final normal14 = basicStyle.copyWith(
    fontSize: 14,
  );
  static final normal12 = basicStyle.copyWith(
    fontSize: 12,
  );
  static final normal8 = basicStyle.copyWith(
    fontSize: 8,
  );
}
