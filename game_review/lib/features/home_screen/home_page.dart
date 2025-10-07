import 'package:flutter/material.dart';
import 'package:game_review/features/home_screen/widgets/games_list_widget.dart';
import 'package:game_review/i18n/strings.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          GamesListWidget(
            title: t.discover,
            limit: 10,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
