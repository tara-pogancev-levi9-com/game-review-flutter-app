import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';
import 'package:game_review/features/library_screen/bloc/library_state.dart';
import 'package:game_review/features/library_screen/widgets/game_section.dart';
import 'package:game_review/i18n/strings.g.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    locator<LibraryCubit>().fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LibraryCubit, LibraryState>(
        bloc: locator<LibraryCubit>(),
        builder: (context, state) {
          return switch (state) {
            LibraryInitial() => const Center(
              child: CircularProgressIndicator(),
            ),
            LibraryLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            LibraryError(:final message) => Center(child: Text(message)),
            LibrarySuccess(
              latestGames: final latest,
              popularGames: final popular,
              userLibraryGames: final userLib,
              userWishlistGames: final wishlist,
            ) =>
              RefreshIndicator(
                onRefresh: () => locator<LibraryCubit>().fetchGames(),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              // Replace with actual user profile image if available (Temporary placeholder for now)
                              'https://i.pravatar.cc/150?img=8',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            t.library.myLibrary,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    GameSection(title: t.library.latest, games: latest),
                    GameSection(title: t.library.popular, games: popular),
                    GameSection(title: t.library.ownedGames, games: userLib),
                    GameSection(title: t.library.wishlist, games: wishlist),
                  ],
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
