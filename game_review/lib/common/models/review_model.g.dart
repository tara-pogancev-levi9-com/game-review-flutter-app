// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  id: json['id'] as String,
  user_id: json['user_id'] as String,
  game_id: json['game_id'] as String,
  title: json['title'] as String?,
  content: json['content'] as String?,
  overall_rating: (json['overall_rating'] as num?)?.toDouble(),
  gameplay_rating: (json['gameplay_rating'] as num?)?.toDouble(),
  graphics_rating: (json['graphics_rating'] as num?)?.toDouble(),
  story_rating: (json['story_rating'] as num?)?.toDouble(),
  sound_rating: (json['sound_rating'] as num?)?.toDouble(),
  value_rating: (json['value_rating'] as num?)?.toDouble(),
  pros: (json['pros'] as List<dynamic>?)?.map((e) => e as String).toList(),
  cons: (json['cons'] as List<dynamic>?)?.map((e) => e as String).toList(),
  playtime_hours: (json['playtime_hours'] as num?)?.toInt(),
  completion_status: json['completion_status'] as String?,
  recommended: json['recommended'] as bool?,
  created_at: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updated_at: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'game_id': instance.game_id,
      'title': instance.title,
      'content': instance.content,
      'overall_rating': instance.overall_rating,
      'gameplay_rating': instance.gameplay_rating,
      'graphics_rating': instance.graphics_rating,
      'story_rating': instance.story_rating,
      'sound_rating': instance.sound_rating,
      'value_rating': instance.value_rating,
      'pros': instance.pros,
      'cons': instance.cons,
      'playtime_hours': instance.playtime_hours,
      'completion_status': instance.completion_status,
      'recommended': instance.recommended,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
