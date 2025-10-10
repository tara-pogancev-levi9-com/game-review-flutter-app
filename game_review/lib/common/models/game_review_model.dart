import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_review_model.freezed.dart';
part 'game_review_model.g.dart';

@freezed
abstract class GameReviewModel with _$GameReviewModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameReviewModel({
    required String id,
    required String userId,
    required String gameId,
    String? title,
    String? content,
    double? overallRating,
    double? gameplayRating,
    double? graphicsRating,
    double? storyRating,
    double? soundRating,
    double? valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GameReviewModel;

  factory GameReviewModel.fromJson(Map<String, dynamic> json) =>
      _$GameReviewModelFromJson(json);
}
