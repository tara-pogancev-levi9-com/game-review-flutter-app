import 'package:flutter/material.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/home_screen/widgets/games_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const GamesListWidget(
            title: 'Discover',
            limit: 10,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent reviews',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
