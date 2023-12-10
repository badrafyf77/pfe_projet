// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import 'package:pfe_projet/core/utils/app_colors.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class MyTextField extends StatefulWidget {
  final bool isPassField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData prefixIcon;
  final String hintText;

  const MyTextField({
    Key? key,
    required this.isPassField,
    required this.controller,
    this.validator,
    this.onChanged,
    required this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
      style: Styles.normal16.copyWith(
        color: AppColors.kPrimaryColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.zero,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            widget.prefixIcon,
            color: AppColors.kPrimaryColor,
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
                  color: AppColors.kPrimaryColor,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.white.withOpacity(.63),
        border: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [
              Color(0XFF827777),
              Color(0XFFEFC887),
            ],
          ),
          width: 0.4,
        ),
        focusedBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [
              Color(0XFF827777),
              Color(0XFFEFC887),
            ],
          ),
          width: 0.4,
        ),
      ),
    );
  }
}
