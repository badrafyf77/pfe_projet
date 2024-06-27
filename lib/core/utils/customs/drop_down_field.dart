import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class MyDropDownField extends StatelessWidget {
  const MyDropDownField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.initialValue,
  });

  final Function(String?)? onChanged;
  final List<String> items;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: initialValue,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(.23),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
        ),
        focusedBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.28),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
