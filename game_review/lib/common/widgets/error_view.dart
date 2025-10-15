import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/i18n/strings.g.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: AppTypography.errorText),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(t.retry),
            ),
          ],
        ),
      ),
    );
  }
}
