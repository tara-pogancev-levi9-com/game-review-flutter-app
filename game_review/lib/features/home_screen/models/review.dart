import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/features/library_screen/models/game.dart';

part 'review.freezed.dart';
part 'review.g.dart';
// DEBUG PHASE - IGNORE FOR NOW
String? _listOrStringToString(dynamic json) {
  if (json == null) return null;
  if (json is String) return json;
  if (json is Iterable) {
    return json.map((e) => e?.toString() ?? '').join(', ');
  }
  return json.toString();
}

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'game_id') String? gameId,
    String? title,
    String? content,
    @JsonKey(name: 'overall_rating') double? overallRating,
    @JsonKey(name: 'gameplay_rating') double? gameplayRating,
    @JsonKey(name: 'graphics_rating') double? graphicsRating,
    @JsonKey(name: 'story_rating') double? storyRating,
    @JsonKey(name: 'sound_rating') double? soundRating,
    @JsonKey(name: 'value_rating') double? valueRating,
    @JsonKey(fromJson: _listOrStringToString) String? pros,
    @JsonKey(fromJson: _listOrStringToString) String? cons,
    @JsonKey(name: 'playtime_hours') int? playtimeHours,
    @JsonKey(name: 'completion_status') String? completionStatus,
    bool? recommended,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(ignore: true) Game? game,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  static Review fromJsonWithNestedGame(Map<String, dynamic> json) {
    final review = Review.fromJson(json);
    final gameJson = json['games'];
    if (gameJson != null && gameJson is Map<String, dynamic>) {
      return review.copyWith(game: Game.fromJson(Map<String, dynamic>.from(gameJson)));
    }
    return review;
  }
}
