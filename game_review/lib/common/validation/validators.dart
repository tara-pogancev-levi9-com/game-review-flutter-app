import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:sprintf/sprintf.dart';

class Validators {
  Validators._();

  static FormFieldValidator<String> email(BuildContext context) {
    final l = Translations.of(context);
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return sprintf(l.errors.requiredField, [l.email]);
      }

      if (!regex.hasMatch(text)) {
        return l.errors.invalidEmail;
      }
      return null;
    };
  }

  static FormFieldValidator<String> password(
    BuildContext context, {
    int minLength = 6,
  }) {
    final l = Translations.of(context);
    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return sprintf(l.errors.requiredField, [l.password]);
      }

      if (text.length < minLength) {
        return sprintf(l.errors.minLength, [minLength]);
      }
      return null;
    };
  }

  static FormFieldValidator<String> required(
    BuildContext context, {
    required String fieldLabel,
  }) {
    final l = Translations.of(context);
    return (value) {
      final text = (value ?? '').trim();

      if (text.isEmpty) {
        return sprintf(l.errors.requiredField, [fieldLabel]);
      }
      return null;
    };
  }
}
