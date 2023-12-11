import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_colors.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      strokeWidth: 2,
      radius: 12,
      gradient: const LinearGradient(
        colors: [
          Color(0XFF4285F4),
          Color(0XFF34A853),
          Color(0XFFFBBC05),
          Color(0XFFEA4335),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.63),
            borderRadius: BorderRadius.circular(12)),
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.googleLogo),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Continuez avec google',
              style: Styles.normal16.copyWith(color: AppColors.kPrimaryColor),
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}

