// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    this.justNumbers = false,
    required this.isPassField,
    this.gradientBorder = true,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.prefixIcon = Icons.abc,
    required this.hintText,
  }) : super(key: key);

  final bool justNumbers;
  final bool isPassField;
  final bool gradientBorder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData prefixIcon;
  final String hintText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool obsecureText;
  @override
  void initState() {
    super.initState();

    obsecureText = widget.isPassField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
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
        prefixIcon: widget.prefixIcon == Icons.abc
            ? const SizedBox()
            : IconButton(
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
                    obsecureText = !obsecureText;
                  });
                },
                icon: Icon(
                  obsecureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.kLightPrimaryColor,
                ),
              )
            : null,
        border: widget.gradientBorder
            ? const GradientOutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  colors: AppColors.kLightGradientColors,
                ),
              )
            : OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
        focusedBorder: widget.gradientBorder
            ? const GradientOutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  colors: AppColors.kLightGradientColors,
                ),
              )
            : OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
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
