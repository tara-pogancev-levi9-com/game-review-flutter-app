// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String?,
  gameId: json['game_id'] as String?,
  title: json['title'] as String?,
  content: json['content'] as String?,
  overallRating: (json['overall_rating'] as num?)?.toDouble(),
  gameplayRating: (json['gameplay_rating'] as num?)?.toDouble(),
  graphicsRating: (json['graphics_rating'] as num?)?.toDouble(),
  storyRating: (json['story_rating'] as num?)?.toDouble(),
  soundRating: (json['sound_rating'] as num?)?.toDouble(),
  valueRating: (json['value_rating'] as num?)?.toDouble(),
  pros: _listOrStringToString(json['pros']),
  cons: _listOrStringToString(json['cons']),
  playtimeHours: (json['playtime_hours'] as num?)?.toInt(),
  completionStatus: json['completion_status'] as String?,
  recommended: json['recommended'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'game_id': instance.gameId,
      'title': instance.title,
      'content': instance.content,
      'overall_rating': instance.overallRating,
      'gameplay_rating': instance.gameplayRating,
      'graphics_rating': instance.graphicsRating,
      'story_rating': instance.storyRating,
      'sound_rating': instance.soundRating,
      'value_rating': instance.valueRating,
      'pros': instance.pros,
      'cons': instance.cons,
      'playtime_hours': instance.playtimeHours,
      'completion_status': instance.completionStatus,
      'recommended': instance.recommended,
      'created_at': instance.createdAt?.toIso8601String(),
    };
