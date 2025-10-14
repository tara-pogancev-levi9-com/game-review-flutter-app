// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameReviewModel _$GameReviewModelFromJson(Map<String, dynamic> json) =>
    _GameReviewModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      overallRating: (json['overall_rating'] as num?)?.toDouble(),
      gameplayRating: (json['gameplay_rating'] as num?)?.toDouble(),
      graphicsRating: (json['graphics_rating'] as num?)?.toDouble(),
      storyRating: (json['story_rating'] as num?)?.toDouble(),
      soundRating: (json['sound_rating'] as num?)?.toDouble(),
      valueRating: (json['value_rating'] as num?)?.toDouble(),
      pros: (json['pros'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cons: (json['cons'] as List<dynamic>?)?.map((e) => e as String).toList(),
      playtimeHours: (json['playtime_hours'] as num?)?.toInt(),
      completionStatus: json['completion_status'] as String?,
      recommended: json['recommended'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isLiked: json['is_liked'] as bool?,
      likesCount: (json['likes_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameReviewModelToJson(_GameReviewModel instance) =>
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
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
    };
