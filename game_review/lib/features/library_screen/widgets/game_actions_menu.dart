import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';

enum GameAction {
  addToWishlist,
  addToLibrary,
  removeFromWishlist,
  removeFromLibrary,
  addReview,
}

class GameActionsMenu extends StatelessWidget {
  final GameModel game;

  const GameActionsMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final cubit = locator<LibraryCubit>();

    return PopupMenuButton<GameAction>(
      onSelected: (value) async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        switch (value) {
          case GameAction.addToWishlist:
            final result = await cubit.addGameToWishlist(game);
            if (result == AddResult.added) {
              _showSnackBar(context, t.gameDetails.addedToWishlist);
            } else if (result == AddResult.alreadyExists) {
              _showSnackBar(context, t.gameDetails.gameAlreadyInWishlist);
            } else {
              _showSnackBar(context, t.gameDetails.failedToAddToWishlist);
            }
            break;

          case GameAction.addToLibrary:
            final result = await cubit.addGameToLibrary(game);
            if (result == AddResult.added) {
              _showSnackBar(context, t.gameDetails.addedToLibrary);
            } else if (result == AddResult.alreadyExists) {
              _showSnackBar(context, t.gameDetails.gameAlreadyInLibrary);
            } else {
              _showSnackBar(context, t.gameDetails.failedToAddToLibrary);
            }
            break;

          case GameAction.removeFromWishlist:
            final removedWishlist = await cubit.removeGameFromWishlist(game);
            _showSnackBar(
              context,
              removedWishlist
                  ? t.gameDetails.removedFromWishlist
                  : t.gameDetails.failedToRemoveFromWishlist,
            );
            break;

          case GameAction.removeFromLibrary:
            final removedLibrary = await cubit.removeGameFromLibrary(game);
            _showSnackBar(
              context,
              removedLibrary
                  ? t.gameDetails.removedFromLibrary
                  : t.gameDetails.failedToRemoveFromLibrary,
            );
            break;

          case GameAction.addReview:
            _showSnackBar(context, t.gameDetails.addReviewComingSoon);
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: GameAction.addToWishlist,
          child: Text(t.gameDetails.addToWishlist),
        ),
        PopupMenuItem(
          value: GameAction.addToLibrary,
          child: Text(t.gameDetails.addToMyLibrary),
        ),
        PopupMenuItem(
          value: GameAction.removeFromWishlist,
          child: Text(t.gameDetails.removeFromWishlist),
        ),
        PopupMenuItem(
          value: GameAction.removeFromLibrary,
          child: Text(t.gameDetails.removeFromMyLibrary),
        ),
        PopupMenuItem(
          value: GameAction.addReview,
          child: Text(t.gameDetails.addReview),
        ),
      ],
      icon: const Icon(Icons.more_vert),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
