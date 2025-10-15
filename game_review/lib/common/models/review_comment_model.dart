import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_comment_model.freezed.dart';
part 'review_comment_model.g.dart';

@freezed
abstract class ReviewCommentModel with _$ReviewCommentModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewCommentModel({
    required String id,
    required String userId,
    required String reviewId,
    String? parentCommentId,
    required String content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ReviewCommentModel;

  factory ReviewCommentModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewCommentModelFromJson(json);
}
