// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserWishlistModel _$UserWishlistModelFromJson(Map<String, dynamic> json) =>
    _UserWishlistModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      priority: (json['priority'] as num?)?.toInt(),
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$UserWishlistModelToJson(_UserWishlistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'game_id': instance.gameId,
      'priority': instance.priority,
      'added_at': instance.addedAt?.toIso8601String(),
    };
