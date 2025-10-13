import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/i18n/strings.g.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final gradients = theme.extension<AppGradients>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: gradients.background),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(
          '${t.errors.appFailedToStart}\n\n$error',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.error,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}