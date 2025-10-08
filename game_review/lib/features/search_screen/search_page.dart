import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/game_details/game_details.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.navigation.search,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GameDetailsPage(
                    gameId:
                        '2e41851c-9a17-4bab-bb5a-6ec903b1245c', // Test game ID
                  ),
                ),
              );
            },
            child: const Text('Test Game Details'),
          ),
        ],
      ),
    );
  }
}
