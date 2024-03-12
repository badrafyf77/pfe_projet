import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    this.justNumbers = false,
    required this.isPassField,
    required this.controller,
    required this.validator,
    this.onChanged,
    required this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  final bool justNumbers;
  final bool isPassField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData prefixIcon;
  final String hintText;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool? obsecureText;
  @override
  void initState() {
    super.initState();

    obsecureText = widget.isPassField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.justNumbers ? TextInputType.number : null,
      style: Styles.normal16.copyWith(
        color: AppColors.kLightPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: AppColors.kLightPrimaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: Styles.normal16.copyWith(
          color: AppColors.kLightPrimaryColor,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(.63),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
          height: 0,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            widget.prefixIcon,
            color: AppColors.kLightPrimaryColor,
          ),
        ),
        suffixIcon: widget.isPassField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText!;
                  });
                },
                icon: Icon(
                  obsecureText! ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.kLightPrimaryColor,
                ),
              )
            : null,
        border: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
        ),
        focusedBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
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
