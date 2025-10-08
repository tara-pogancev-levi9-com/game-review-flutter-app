// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModel _$GameModelFromJson(Map<String, dynamic> json) => _GameModel(
  id: json['id'] as String,
  title: json['title'] as String,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  platforms: (json['platforms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  developer: json['developer'] as String?,
  publisher: json['publisher'] as String?,
  releaseDate: json['release_date'] as String?,
  coverImageUrl: json['cover_image_url'] as String?,
);

Map<String, dynamic> _$GameModelToJson(_GameModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genres': instance.genres,
      'platforms': instance.platforms,
      'description': instance.description,
      'developer': instance.developer,
      'publisher': instance.publisher,
      'release_date': instance.releaseDate,
      'cover_image_url': instance.coverImageUrl,
    };
