import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:pfe_projet/core/utils/app_colors.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.62),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        cursorColor: AppColors.kPrimaryColor,
        cursorWidth: 1,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "",
          border: GradientOutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color(0XFF827777),
                Color(0XFFEFC887),
              ],
            ),
            width: 1,
          ),
          focusedBorder: GradientOutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color(0XFF827777),
                Color(0XFFEFC887),
              ],
            ),
            width: 1,
          ),
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimaryColor),
      ),
    );
  }
}
