import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/home_screen/bloc/home_cubit.dart';
import 'package:game_review/features/home_screen/bloc/home_state.dart';
import 'package:game_review/features/home_screen/review_details.page.dart';
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

  @override
  void initState() {
    super.initState();
    cubit = locator<HomeCubit>();
    cubit.loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          success: (discoverGames, recentReviews) {
            return RefreshIndicator(
              onRefresh: () => cubit.refresh(),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(t.discover, style: Theme.of(context).textTheme.headlineSmall),
                  ),

                  // Discover games
                  GameSection(title: t.discover, games: discoverGames),

                  // Recent reviews header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                    child: Text(t.recentReviews, style: Theme.of(context).textTheme.headlineSmall),
                  ),

                  // Recent reviews list (vertical)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: recentReviews.map((r) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ReviewCard(
                            review: r,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => ReviewDetailsPage(review: r)),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
