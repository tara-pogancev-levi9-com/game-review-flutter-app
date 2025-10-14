import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/widgets/app_snackbar.dart';
import 'package:game_review/features/search_screen/bloc/search_cubit.dart';
import 'package:game_review/features/search_screen/bloc/search_state.dart';
import 'package:game_review/features/search_screen/widgets/empty_state.dart';
import 'package:game_review/features/search_screen/widgets/horizontal_games_list.dart';
import 'package:game_review/features/search_screen/widgets/horizontal_reviews_list.dart';
import 'package:game_review/features/search_screen/widgets/no_resaults.dart';
import 'package:game_review/features/search_screen/widgets/search_bar_widget.dart';
import 'package:game_review/features/search_screen/widgets/section_header.dart';
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
        SearchBarWidget(
          controller: _searchController,
          onChanged: _onSearchChanged,
          onClear: () {
            _searchController.clear();
            _searchCubit.clear();
          },
        ),

        // Search Results
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            bloc: _searchCubit,
            builder: (context, state) {
              return state.when(
                initial: () => EmptyState(t: t),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (games, reviews, query) {
                  if (games.isEmpty && reviews.isEmpty) {
                    return NoResaults(t: t, query: query);
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Games Section
                        if (games.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SectionHeader(
                              title: t.gamesSection,
                              count: games.length,
                            ),
                          ),
                          const SizedBox(height: 16),
                          HorizontalGamesList(games: games),
                          const SizedBox(height: 32),
                        ],

                        // Reviews Section
                        if (reviews.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SectionHeader(
                              title: t.reviewsSection,
                              count: reviews.length,
                            ),
                          ),
                          const SizedBox(height: 16),
                          HorizontalReviewsList(reviews: reviews),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  );
                },
                error: (message) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AppSnackbar.showError(context, message);
                  });
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
