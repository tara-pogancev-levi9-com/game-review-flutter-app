import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              '${t.errors.appFailedToStart}\n\n$error',
              style: TextStyle(
                color: colorScheme.error,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}