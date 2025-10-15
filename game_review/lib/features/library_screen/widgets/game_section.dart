import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';

import '../../home_screen/widgets/game_card.dart';

class GameSection extends StatefulWidget {
  final String? title;
  final List<GameModel> games;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;

  const GameSection({
    super.key,
    this.title,
    required this.games,
    this.hasMore = false,
    this.isLoadingMore = false,
    required this.onLoadMore,
  });

  @override
  State<GameSection> createState() => _GameSectionState();
}

class _GameSectionState extends State<GameSection> {
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
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 200) {
      if (widget.hasMore && !widget.isLoadingMore) {
        widget.onLoadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.games.isEmpty) return const SizedBox.shrink();

    final itemCount = widget.games.length + (widget.hasMore ? 1 : 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              widget.title!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
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
        ),
      ],
    );
  }
}
