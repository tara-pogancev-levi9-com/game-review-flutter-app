import 'package:flutter/material.dart';
import 'package:game_review/features/home_screen/widgets/game_selector_bottom_sheet.dart';

class AddGameFab extends StatelessWidget {
  AddGameFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const GameSelectorBottomSheet(),
        );
      },
      child: const Icon(Icons.edit),
    );
  }
}
