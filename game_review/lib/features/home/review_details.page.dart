import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/home/bloc/review_comments_cubit.dart';
import 'package:game_review/features/home/bloc/review_comments_state.dart';
import 'package:game_review/features/home/models/review.dart';
import 'package:game_review/features/home/models/review_comment.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewDetailsPage extends StatefulWidget {
  final Review review;

  const ReviewDetailsPage({super.key, required this.review});

  @override
  State<ReviewDetailsPage> createState() => _ReviewDetailsPageState();
}

class _ReviewDetailsPageState extends State<ReviewDetailsPage> {
  late final ReviewCommentsCubit _commentsCubit;

  @override
  void initState() {
    super.initState();
    _commentsCubit = locator<ReviewCommentsCubit>();
    _commentsCubit.loadComments(widget.review.id);
  }

  String _formatDate(DateTime? dt) {
    if (dt == null) return '';
    final d = dt.toLocal();
    return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Widget _ratingStars(double? rating) {
    final v = (rating ?? 0).clamp(0, 10);
    final filled = (v / 2).round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < filled) return const Icon(Icons.star, size: 18);
        return const Icon(Icons.star_border, size: 18);
      }),
    );
  }

  Widget _chip(String label, {IconData? icon}) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      label: Text(label, style: const TextStyle(fontSize: 12)),
      avatar: icon != null ? Icon(icon, size: 14) : null,
    );
  }

  Widget _mediaThumb() {
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Icon(Icons.play_circle_outline)),
    );
  }

  Widget _ratingRow(BuildContext ctx, String label, double? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: Theme.of(ctx).textTheme.bodyMedium)),
          _ratingStars(value),
          const SizedBox(width: 10),
          Text((value ?? 0).toString(), style: Theme.of(ctx).textTheme.bodySmall),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    final cover = review.game?.coverImageUrl;
    final gameTitle = review.game?.title ?? review.gameId ?? t.gameDetails.details;
    final reviewer = review.userId ?? 'User';
    final reviewTitle = review.title;
    final content = review.content;
    final createdAt = _formatDate(review.createdAt);

    // Likes placeholder
    final likesCount = 0;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(t.gameDetails.details),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: implement like review (service)
            },
            icon: const Icon(Icons.thumb_up_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Cover image area
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              image: cover != null ? DecorationImage(image: NetworkImage(cover), fit: BoxFit.cover) : null,
            ),
            child: cover == null ? const Center(child: Icon(Icons.image, size: 48)) : null,
          ),

          // Game title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(gameTitle, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          ),

          // Reviewer and date row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Row(
              children: [
                const Icon(Icons.person, size: 16),
                const SizedBox(width: 8),
                Text(reviewer, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Text(createdAt, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),

          // Review title
          if (reviewTitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(reviewTitle, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ),

          // Review content
          if (content != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(content, style: Theme.of(context).textTheme.bodyMedium),
            ),

          // Bubbles
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _chip('${review.playtimeHours ?? 0}h on record', icon: Icons.schedule),
                _chip(review.completionStatus ?? '-', icon: Icons.check_circle_outline),
                _chip(review.recommended == true ? 'Would recommend' : 'Would not recommend', icon: Icons.thumb_up),
                _chip('$likesCount likes', icon: Icons.favorite_outline),
                BlocBuilder<ReviewCommentsCubit, ReviewCommentsState>(
                  bloc: _commentsCubit,
                  builder: (context, state) {
                    final commentsCount = state.maybeWhen(success: (list) => list.length, orElse: () => 0);
                    return _chip('$commentsCount comments', icon: Icons.comment_outlined);
                  },
                ),
              ],
            ),
          ),

          // Ratings section header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(t.ratings, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),

          // Ratings list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _ratingRow(context, t.overall, review.overallRating),
                _ratingRow(context, t.gameplay, review.gameplayRating),
                _ratingRow(context, t.graphics, review.graphicsRating),
                _ratingRow(context, t.story, review.storyRating),
                _ratingRow(context, t.sound, review.soundRating),
                _ratingRow(context, t.value, review.valueRating),
              ],
            ),
          ),

          // Evaluation (Pros / Cons)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(t.evaluation, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),

          if (review.pros != null && review.pros!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [const Icon(Icons.check_circle_outline), const SizedBox(width: 8), Text(t.pros, style: Theme.of(context).textTheme.titleSmall)]),
                const SizedBox(height: 8),
                Text(review.pros!, style: Theme.of(context).textTheme.bodyMedium),
              ]),
            ),

          if (review.cons != null && review.cons!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [const Icon(Icons.block_outlined), const SizedBox(width: 8), Text(t.cons, style: Theme.of(context).textTheme.titleSmall)]),
                const SizedBox(height: 8),
                Text(review.cons!, style: Theme.of(context).textTheme.bodyMedium),
              ]),
            ),

          // Media
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(t.media, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                _mediaThumb(),
                const SizedBox(width: 8),
                _mediaThumb(),
                const SizedBox(width: 8),
                _mediaThumb(),
              ],
            ),
          ),

          // Discussions header (with dynamic count)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: BlocBuilder<ReviewCommentsCubit, ReviewCommentsState>(
              bloc: _commentsCubit,
              builder: (context, state) {
                final count = state.maybeWhen(success: (list) => list.length, orElse: () => 0);
                return Text('${t.discussions} ($count)', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold));
              },
            ),
          ),

          // Comments list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ReviewCommentsCubit, ReviewCommentsState>(
              bloc: _commentsCubit,
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (msg) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Error loading comments: $msg', style: Theme.of(context).textTheme.bodySmall),
                  ),
                  success: (comments) {
                    if (comments.isEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(t.reviewsNotFound),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                // TODO: open comment composer
                              },
                              child: Text(t.addComment),
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        ...comments.map((ReviewComment c) => Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const CircleAvatar(child: Icon(Icons.person)),
                                  title: Text(c.userId ?? 'User', style: Theme.of(context).textTheme.bodySmall),
                                  subtitle: Text(c.content ?? '', style: Theme.of(context).textTheme.bodyMedium),
                                  trailing: Text(_formatDate(c.createdAt), style: Theme.of(context).textTheme.bodySmall),
                                ),
                                const SizedBox(height: 8),
                              ],
                            )),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // TODO: open comment composer
                            },
                            child: Text(t.addComment),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
