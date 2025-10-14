import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_theme.dart';
import 'package:game_review/features/game_details/bloc/game_details_cubit.dart';
import 'package:game_review/features/game_details/bloc/game_details_state.dart';
import 'package:game_review/features/game_details/widgets/game_content_widget.dart';
import 'package:game_review/features/game_details/widgets/login_required_widget.dart';
import 'package:game_review/features/game_details/widgets/reviews_section_widget.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/core/storage/secure_storage.dart';

class GameDetailsPage extends StatelessWidget {
  final String gameId;

  const GameDetailsPage({
    super.key,
    required this.gameId,
  });

  @override
  Widget build(BuildContext context) {
    final token = SecureStorage.getToken();

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: Theme.of(context).extension<AppGradients>()?.background,
        ),
        child: token == null
            ? const LoginRequiredWidget()
            : BlocProvider(
                create: (context) =>
                    GameDetailsCubit()..loadGameDetails(gameId),
                child: Builder(
                  builder: (context) {
                    final cubit = context.read<GameDetailsCubit>();

                    return BlocConsumer<GameDetailsCubit, GameDetailsState>(
                      listener: (context, state) {
                        if (state is GameDetailsLoaded) {
                          if (cubit.successMessage != null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(cubit.successMessage!),
                                backgroundColor: AppColors.success,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                            cubit.clearSuccessMessage();
                          }
                        }
                      },
                      builder: (context, state) {
                        return switch (state) {
                          GameDetailsLoading() => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          GameDetailsError(message: final message) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 64,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  message,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    cubit.loadGameDetails(gameId);
                                  },
                                  child: Text(t.gameDetails.retry),
                                ),
                              ],
                            ),
                          ),
                          GameDetailsLoaded(
                            game: final game,
                            isInWishlist: final isInWishlist,
                            isInLibrary: final isInLibrary,
                          ) =>
                            CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                  backgroundColor: AppColors.transparent,
                                  elevation: 0,
                                  pinned: true,
                                  expandedHeight: 220,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: AppTheme
                                              .borderRadiusMedium
                                              .topLeft,
                                          bottomRight: AppTheme
                                              .borderRadiusMedium
                                              .topRight,
                                        ),
                                        color: AppColors.surfaceVariant,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: AppTheme
                                              .borderRadiusMedium
                                              .topLeft,
                                          bottomRight: AppTheme
                                              .borderRadiusMedium
                                              .topRight,
                                        ),
                                        child: game.coverImageUrl != null
                                            ? Image.network(
                                                game.coverImageUrl!,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.topCenter,
                                                errorBuilder:
                                                    (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) {
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                              color: AppColors
                                                                  .surfaceVariant,
                                                            ),
                                                        child: const Icon(
                                                          Icons
                                                              .image_not_supported,
                                                          size: 64,
                                                          color: AppColors
                                                              .textSecondary,
                                                        ),
                                                      );
                                                    },
                                              )
                                            : Container(
                                                decoration: const BoxDecoration(
                                                  color:
                                                      AppColors.surfaceVariant,
                                                ),
                                                child: const Icon(
                                                  Icons.image_not_supported,
                                                  size: 64,
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  leading: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.white,
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  title: Image.asset(
                                    'lib/common/assets/images/game_logo.png',
                                    height: 32,
                                    fit: BoxFit.contain,
                                  ),
                                  centerTitle: true,
                                ),
                                SliverToBoxAdapter(
                                  child: GameContentWidget(
                                    game: game,
                                    gameId: gameId,
                                    isInWishlist: isInWishlist,
                                    isInLibrary: isInLibrary,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: ReviewsSectionWidget(gameId: gameId),
                                ),
                              ],
                            ),
                          GameDetailsInitial() => const SizedBox.shrink(),
                        };
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
