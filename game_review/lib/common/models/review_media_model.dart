import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_media_model.freezed.dart';
part 'review_media_model.g.dart';

@freezed
abstract class ReviewMediaModel with _$ReviewMediaModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewMediaModel({
    required String id,
    required String reviewId,
    required String mediaType,
    required String mediaUrl,
  }) = _ReviewMediaModel;

  factory ReviewMediaModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewMediaModelFromJson(json);
}
