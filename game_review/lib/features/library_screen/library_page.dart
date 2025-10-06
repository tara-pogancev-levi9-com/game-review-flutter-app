import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.navigation.library,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}