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
    final l = t;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.navigation.library),
      ),
      body: BlocBuilder<LibraryCubit, LibraryState>(
        bloc: locator<LibraryCubit>(),
        builder: (context, state) {
          return switch (state) {
            LibraryInitial() => const Center(child: CircularProgressIndicator()),
            LibraryLoading() => const Center(child: CircularProgressIndicator()),
            LibraryError(:final message) => Center(child: Text(message)),
            LibrarySuccess(
              latestGames: final latest,
              popularGames: final popular,
              userLibraryGames: final userLib,
              userWishlistGames: final wishlist,
            ) =>
              RefreshIndicator(
                onRefresh: () => locator<LibraryCubit>().fetchGames(), // Q: Is this good? Or should there be a mechanism that does this only once (or every 30, 60, 90 ... minutes, seconds, ...) instead of doing it every time when we open the page?
                child: ListView(
                  children: [
                    GameSection(title: l.library.latest, games: latest),
                    GameSection(title: l.library.popular, games: popular),
                    GameSection(title: l.library.userLibrary, games: userLib),
                    GameSection(title: l.library.wishlist, games: wishlist),
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