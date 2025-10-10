import 'package:flutter/material.dart';
import 'package:game_review/features/home_screen/widgets/games_list_widget.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/game_details/game_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          GamesListWidget(
            title: t.discover,
            limit: 10,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.home,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GameDetailsPage(
                    gameId:
                        '2e41851c-9a17-4bab-bb5a-6ec903b1245c', // test game ID
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
