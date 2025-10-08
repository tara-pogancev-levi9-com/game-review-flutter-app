import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/game_details/bloc/game_details_cubit.dart';
import 'package:game_review/features/game_details/widgets/game_content_widget.dart';
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
    return FutureBuilder<String?>(
      future: SecureStorage.getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == null) {
          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryPurple,
                    AppColors.nearBlack,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      t.gameDetails.loginRequiredToView,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(t.common.goBack),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return BlocProvider(
          create: (context) => GameDetailsCubit()..loadGameDetails(gameId),
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryPurple,
                    AppColors.nearBlack,
                  ],
                ),
              ),
              child: BlocListener<GameDetailsCubit, GameDetailsState>(
                listener: (context, state) {
                  if (state is GameDetailsLoaded) {
                    final cubit = context.read<GameDetailsCubit>();
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
                child: BlocBuilder<GameDetailsCubit, GameDetailsState>(
                  builder: (context, state) {
                    if (state is GameDetailsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is GameDetailsError) {
                      return Center(
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
                              state.message,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<GameDetailsCubit>()
                                    .loadGameDetails(
                                      gameId,
                                    );
                              },
                              child: Text(t.gameDetails.retry),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is GameDetailsLoaded) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: AppColors.transparent,
                            elevation: 0,
                            pinned: true,
                            expandedHeight: 220,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: AppColors.surfaceVariant,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: state.game.coverImageUrl != null
                                      ? Image.network(
                                          state.game.coverImageUrl!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                        color: AppColors
                                                            .surfaceVariant,
                                                      ),
                                                  child: const Icon(
                                                    Icons.image_not_supported,
                                                    size: 64,
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                                );
                                              },
                                        )
                                      : Container(
                                          decoration: const BoxDecoration(
                                            color: AppColors.surfaceVariant,
                                          ),
                                          child: const Icon(
                                            Icons.image_not_supported,
                                            size: 64,
                                            color: AppColors.textSecondary,
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
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            title: Image.asset(
                              'lib/common/assets/images/game_logo.png',
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            centerTitle: true,
                          ),

                          // SliverToBoxAdapter(
                          //   child: GameStatsWidget(
                          //     gameId: gameId,
                          //     statistics: state.statistics,
                          //   ),
                          // ),
                          SliverToBoxAdapter(
                            child: GameContentWidget(
                              game: state.game,
                              gameId: gameId,
                              isInWishlist: state.isInWishlist,
                              isInLibrary: state.isInLibrary,
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: ReviewsSectionWidget(gameId: gameId),
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
