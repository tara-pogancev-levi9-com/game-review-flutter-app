import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/home_screen/bloc/home_cubit.dart';
import 'package:game_review/features/home_screen/bloc/home_state.dart';
import 'package:game_review/features/home_screen/review_details.page.dart';
import 'package:game_review/features/home_screen/widgets/add_game_fab.dart';
import 'package:game_review/features/home_screen/widgets/review_card.dart';
import 'package:game_review/features/library_screen/widgets/game_section.dart';
import 'package:game_review/i18n/strings.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = locator<HomeCubit>();
    cubit.loadHome();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        cubit.loadMoreReviews();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success:
                (
                  discoverGames,
                  recentReviews,
                  isLoadingMore,
                  hasMore,
                  isLoadingMoreGames,
                  hasMoreGames,
                ) {
                  return RefreshIndicator(
                    onRefresh: () => cubit.refresh(),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: GameSection(
                            games: discoverGames,
                            title: t.navigation.discover,
                            hasMore: hasMoreGames,
                            isLoadingMore: isLoadingMoreGames,
                            onLoadMore: () => cubit.loadMoreGames(),
                          ),
                        ),

                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                            child: Text(
                              t.home.recentReviews,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),

                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index >= recentReviews.length) {
                                if (!hasMore) return const SizedBox.shrink();
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              final r = recentReviews[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  16,
                                  0,
                                  16,
                                  12,
                                ),
                                child: ReviewCard(
                                  review: r,
                                  onDetails: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ReviewDetailsPage(review: r),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            childCount:
                                recentReviews.length + (hasMore ? 1 : 0),
                          ),
                        ),

                        const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      ],
                    ),
                  );
                },
          );
        },
      ),
      floatingActionButton: AddGameFab(
        onReviewAdded: () {
          cubit.refresh();
        },
      ),
    );
  }
}
