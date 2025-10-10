// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLibraryModel _$UserLibraryModelFromJson(Map<String, dynamic> json) =>
    _UserLibraryModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      platformId: json['platform_id'] as String?,
      hoursPlayed: (json['hours_played'] as num).toInt(),
      completionPercentage: (json['completion_percentage'] as num).toDouble(),
      lastPlayed: json['last_played'] == null
          ? null
          : DateTime.parse(json['last_played'] as String),
      isFavorite: json['is_favorite'] as bool,
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$UserLibraryModelToJson(_UserLibraryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'game_id': instance.gameId,
      'platform_id': instance.platformId,
      'hours_played': instance.hoursPlayed,
      'completion_percentage': instance.completionPercentage,
      'last_played': instance.lastPlayed?.toIso8601String(),
      'is_favorite': instance.isFavorite,
      'added_at': instance.addedAt?.toIso8601String(),
    };
