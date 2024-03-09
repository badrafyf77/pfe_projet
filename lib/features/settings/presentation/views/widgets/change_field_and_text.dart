import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';

class SecurityFieldAndTextItem extends StatelessWidget {
  const SecurityFieldAndTextItem({
    Key? key,
    required this.text,
    required this.passController,
    required this.validator,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  final String text;
  final TextEditingController passController;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeEmailAndPasswordText(
          text: text,
        ),
        const SizedBox(
          height: 8,
        ),
        SecurityTextField(
          controller: passController,
          validator: validator,
          obscureText: obscureText,
          hintText: hintText,
        ),
      ],
    );
  }
}

class SecurityTextField extends StatelessWidget {
  const SecurityTextField({
    Key? key,
    required this.obscureText,
    required this.hintText,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      style: Styles.normal18.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.normal16.copyWith(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.kThirdColor,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
          height: 0,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class ChangeEmailAndPasswordText extends StatelessWidget {
  const ChangeEmailAndPasswordText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Styles.normal16.copyWith(
          color: themeChange.darkTheme
              ? AppColors.kThirdColor
              : Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
