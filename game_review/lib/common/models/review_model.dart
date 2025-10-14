import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/game_model.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewModel({
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
    GameModel? game,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  static ReviewModel fromJsonWithNestedGame(Map<String, dynamic> json) {
    final review = ReviewModel.fromJson(json);
    final gameJson = json['games'];
    if (gameJson != null && gameJson is Map<String, dynamic>) {
      return review.copyWith(
        game: GameModel.fromJson(Map<String, dynamic>.from(gameJson)),
      );
    }
    return review;
  }
}

extension ReviewModelExtension on ReviewModel {
  //Converts to JSON removing NULL values for API requests
  Map<String, dynamic> toJsonForApi({bool includeNulls = false}) {
    final json = toJson();

    if (includeNulls) {
      return json;
    }

    //Remove null values and system generated fields
    json.removeWhere(
      (key, value) =>
          value == null ||
          key == 'id' ||
          key == 'created_at' ||
          key == 'updated_at',
    );

    return json;
  }
}
