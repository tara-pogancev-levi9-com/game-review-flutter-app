import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/features/home_screen/bloc/review_comments_cubit.dart';
import 'package:game_review/features/home_screen/bloc/review_comments_state.dart';
import 'package:game_review/features/home_screen/utils/formatters.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCommentsCubit, ReviewCommentsState>(
      bloc: _cubit,
      builder: (context, state) {
        final count = state.maybeWhen(
          success: (list) => list.length,
          orElse: () => 0,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${t.discussions} ($count)',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '${t.errors.failedToLoadComments}: $msg',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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

                      Center(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: open comment composer
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 28,
                            ),
                          ),
                          child: Text(
                            t.addComment,
                            style: AppTypography.buttonLarge,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    ...comments.map(
                      (ReviewCommentModel c) => Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(
                              c.userId ?? 'User',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            subtitle: Text(
                              c.content ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            trailing: Text(
                              c.createdAt?.formattedIso ?? '',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: open comment composer
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 28,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        child: Text(
                          t.addComment,
                          style: AppTypography.buttonLarge,
                        ),
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
