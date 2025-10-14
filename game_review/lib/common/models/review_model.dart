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
    String? username,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  static ReviewModel fromJsonWithNestedGameAndUser(Map<String, dynamic> json) {
    final review = ReviewModel.fromJson(json);
    final gameJson = json['games'];
    final userJson = json['users'];

    String? username;
    if (userJson != null && userJson is Map<String, dynamic>) {
      username = userJson['username'] as String?;
    }

    GameModel? game;
    if (gameJson != null && gameJson is Map<String, dynamic>) {
      game = GameModel.fromJson(Map<String, dynamic>.from(gameJson));
    }

    return review.copyWith(
      game: game,
      username: username,
    );
  }
}

extension ReviewModelExtension on ReviewModel {
  Map<String, dynamic> toJsonForApi({bool includeNulls = false}) {
    final json = toJson();

    if (includeNulls) {
      return json;
    }

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
