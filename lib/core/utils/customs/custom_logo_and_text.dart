import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class LogoAndText extends StatelessWidget {
  const LogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.appLogo),
        Text(
          'ITUS INSURANCE',
          style: GoogleFonts.comfortaa(
              textStyle: Styles.semiBold24.copyWith(
            color: Colors.white,
          )),
        ),
      ],
    );
  }
}
