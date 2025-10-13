// lib/common/widgets/app_snackbar.dart (renamed from error_snackbar.dart)
import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class AppSnackbar {
  AppSnackbar._(); // Private constructor to prevent instantiation

  /// Show an error snackbar
  static void showError(
    BuildContext context,
    String message, {
    dynamic error,
    Duration duration = const Duration(seconds: 4),
  }) {
    if (error != null) {
      debugPrint('Error details: $error');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Show a success snackbar
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show an info/default snackbar
  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor ?? AppColors.primaryPurple,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show a warning snackbar
  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
