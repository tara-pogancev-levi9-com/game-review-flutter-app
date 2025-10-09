import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/home/bloc/review_comments_cubit.dart';
import 'package:game_review/features/home/bloc/review_comments_state.dart';
import 'package:game_review/features/home/models/review_comment.dart';
import 'package:game_review/i18n/strings.g.dart';

class CommentsSection extends StatefulWidget {
  final String reviewId;
  const CommentsSection({super.key, required this.reviewId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  late final ReviewCommentsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = locator<ReviewCommentsCubit>();
    _cubit.loadComments(widget.reviewId);
  }

  String _formatDate(DateTime? dt) {
    if (dt == null) return '';
    final d = dt.toLocal();
    return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCommentsCubit, ReviewCommentsState>(
      bloc: _cubit,
      builder: (context, state) {
        final count = state.maybeWhen(success: (list) => list.length, orElse: () => 0);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${t.discussions} ($count)', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            state.when(
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
                      OutlinedButton(
                        onPressed: () {
                          // TODO: open comment composer
                        },
                        child: Text(t.addComment),
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
            ),
          ],
        );
      },
    );
  }
}
