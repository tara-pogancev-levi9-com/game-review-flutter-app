import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_comment.freezed.dart';
part 'review_comment.g.dart';

@freezed
class ReviewComment with _$ReviewComment {
  const factory ReviewComment({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'review_id') String? reviewId,
    @JsonKey(name: 'parent_comment_id') String? parentCommentId,
    String? content,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ReviewComment;

  factory ReviewComment.fromJson(Map<String, dynamic> json) => _$ReviewCommentFromJson(json);
}
