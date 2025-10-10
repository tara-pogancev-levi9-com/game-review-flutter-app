import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/border_size.dart';

class CustomTextFormField extends StatelessWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool firstInput;

  const CustomTextFormField({
    super.key,
    this.fieldKey,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.firstInput = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.textPrimary),
      onChanged: (value) {
        if (fieldKey != null && !firstInput) {
          fieldKey!.currentState?.validate();
        }
      },
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [],

      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
        ),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderSize.m.radius,
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderSize.m.radius,
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderSize.m.radius,
          borderSide: const BorderSide(
            color: AppColors.lilacSelected,
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderSize.m.radius,
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderSize.m.radius,
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.8,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
