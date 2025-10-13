import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/features/home_screen/widgets/game_card.dart';
import 'package:game_review/i18n/strings.g.dart';

class GamesList extends StatefulWidget {
  final List<GameModel> games;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;

  const GamesList({
    super.key,
    required this.games,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onLoadMore,
  });

  @override
  State<GamesList> createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (widget.hasMore && !widget.isLoadingMore) {
        widget.onLoadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.games.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(t.NoGamesFound),
        ),
      );
    }

    final itemCount = widget.games.length + (widget.hasMore ? 1 : 0);

    return SizedBox(
      height: 240,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          if (index == widget.games.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return GameCard(game: widget.games[index]);
        },
      ),
    );
  }
}
