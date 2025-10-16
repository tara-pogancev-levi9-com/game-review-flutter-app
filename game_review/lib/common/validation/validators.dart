import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';

class Validators {
  Validators._();

  static FormFieldValidator<String> email(BuildContext context) {
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return t.errors.requiredField(field: t.email);
      }

      if (!regex.hasMatch(text)) {
        return t.errors.invalidEmail;
      }
      return null;
    };
  }

  static FormFieldValidator<String> password(
    BuildContext context, {
    int minLength = 6,
  }) {
    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return t.errors.requiredField(field: t.password);
      }

      if (text.length < minLength) {
        return t.errors.minLength(count: minLength);
      }
      return null;
    };
  }

  static FormFieldValidator<String> required(
    BuildContext context, {
    required String fieldLabel,
  }) {
    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return t.errors.requiredField(field: fieldLabel);
      }
      return null;
    };
  }
}
