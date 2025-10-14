import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/features/search_screen/bloc/search_cubit.dart';
import 'package:game_review/features/search_screen/bloc/search_state.dart';
import 'package:game_review/features/search_screen/widgets/game_search_item.dart';
import 'package:game_review/features/search_screen/widgets/review_search_item.dart';
import 'package:game_review/i18n/strings.g.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchCubit _searchCubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchCubit = locator<SearchCubit>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchCubit.close();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (value.trim().isEmpty) {
      _searchCubit.clear();
    } else {
      _searchCubit.search(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(24),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: const TextStyle(color: AppColors.textPrimary),
            autocorrect: false,
            enableSuggestions: false,
            enableIMEPersonalizedLearning: false,
            autofillHints: const [],
            decoration: InputDecoration(
              hintText: t.searchGames,
              hintStyle: const TextStyle(color: AppColors.textSecondary),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.lilacSelected,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear_rounded,
                        color: AppColors.lilacSelected,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        _searchCubit.clear();
                      },
                    )
                  : null,
              filled: true,
              fillColor: AppColors.surfaceVariant,
            ),
          ),
        ),

        // Search Results
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            bloc: _searchCubit,
            builder: (context, state) {
              return state.when(
                initial: () => _buildEmptyState(t),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (games, reviews, query) {
                  if (games.isEmpty && reviews.isEmpty) {
                    return _buildNoResults(t, query);
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Games Section
                        if (games.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: _buildSectionHeader(
                              t.gamesSection,
                              games.length,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildHorizontalGamesList(games),
                          const SizedBox(height: 32),
                        ],

                        // Reviews Section
                        if (reviews.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: _buildSectionHeader(
                              t.gamesSection,
                              reviews.length,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildHorizontalReviewsList(reviews),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  );
                },
                error: (message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      message,
                      style: AppTypography.errorText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalGamesList(List games) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Container(
                width: 320,
                margin: EdgeInsets.only(
                  right: index < games.length - 1 ? 16 : 0,
                ),
                child: GameSearchItem(game: games[index]),
              );
            },
          ),
        ),
        // Scroll hint indicator
        if (games.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.swipe_rounded,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  t.swipeToSeeMore,
                  style: AppTypography.searchItemSubtitle.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildHorizontalReviewsList(List reviews) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return Container(
                width: 340,
                margin: EdgeInsets.only(
                  right: index < reviews.length - 1 ? 16 : 0,
                ),
                child: ReviewSearchItem(review: reviews[index]),
              );
            },
          ),
        ),
        // Scroll hint indicator
        if (reviews.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.swipe_rounded,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  t.swipeToSeeMore,
                  style: AppTypography.searchItemSubtitle.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyState(Translations t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_rounded,
            size: 80,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            t.searchGames,
            style: AppTypography.heading.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults(Translations t, String query) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 80,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              t.noResultsFound(query: query),
              style: AppTypography.heading.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypography.gameTitle28,
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderSize.s.radius,
          ),
          child: Text(
            count.toString(),
            style: AppTypography.smallText,
          ),
        ),
      ],
    );
  }
}
