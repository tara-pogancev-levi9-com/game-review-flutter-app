import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';
import 'package:game_review/features/library_screen/temporary_placeholder/models/game.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameActionsMenu extends StatelessWidget {
  final Game game;

  const GameActionsMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final cubit = locator<LibraryCubit>();

    return PopupMenuButton<String>(
      onSelected: (value) async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        switch (value) {
          case 'wishlist':
            final result = await cubit.addGameToWishlist(game);
            if (result == AddResult.added) {
              _showSnackBar(context, t.gameDetails.addedToWishlist);
            } else if (result == AddResult.alreadyExists) {
              _showSnackBar(context, t.gameDetails.gameAlreadyInWishlist);
            } else {
              _showSnackBar(context, t.gameDetails.failedToAddToWishlist);
            }
            break;

          case 'library':
            final result = await cubit.addGameToLibrary(game);
            if (result == AddResult.added) {
              _showSnackBar(context, t.gameDetails.addedToLibrary);
            } else if (result == AddResult.alreadyExists) {
              _showSnackBar(context, t.gameDetails.gameAlreadyInLibrary);
            } else {
              _showSnackBar(context, t.gameDetails.failedToAddToLibrary);
            }
            break;

          case 'remove_wishlist':
            final removedWishlist = await cubit.removeGameFromWishlist(game);
            _showSnackBar(
              context,
              removedWishlist
                  ? t.gameDetails.removedFromWishlist
                  : t.gameDetails.failedToRemoveFromWishlist,
            );
            break;

          case 'remove_library':
            final removedLibrary = await cubit.removeGameFromLibrary(game);
            _showSnackBar(
              context,
              removedLibrary
                  ? t.gameDetails.removedFromLibrary
                  : t.gameDetails.failedToRemoveFromLibrary,
            );
            break;

          case 'review':
            _showSnackBar(context, t.gameDetails.addReviewComingSoon);
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'wishlist', child: Text(t.gameDetails.addToWishlist)),
        PopupMenuItem(value: 'library', child: Text(t.gameDetails.addToMyLibrary)),
        PopupMenuItem(value: 'remove_wishlist', child: Text(t.gameDetails.removeFromWishlist)),
        PopupMenuItem(value: 'remove_library', child: Text(t.gameDetails.removeFromMyLibrary)),
        PopupMenuItem(value: 'review', child: Text(t.gameDetails.addReview)),
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