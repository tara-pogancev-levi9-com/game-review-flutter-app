import 'package:flutter/material.dart';
import 'package:game_review/features/home_screen/widgets/game_selector_bottom_sheet.dart';

class AddGameFab extends StatelessWidget {
  final VoidCallback? onReviewAdded;

  const AddGameFab({
    super.key,
    this.onReviewAdded,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showModalBottomSheet<bool>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const GameSelectorBottomSheet(),
        );

        if (result == true && onReviewAdded != null) {
          onReviewAdded!();
        }
      },
      child: const Icon(Icons.edit),
    );
  }
}
