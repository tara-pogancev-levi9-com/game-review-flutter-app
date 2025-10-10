// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  developer: json['developer'] as String?,
  publisher: json['publisher'] as String?,
  releaseDate: json['release_date'] == null
      ? null
      : DateTime.parse(json['release_date'] as String),
  coverImageUrl: json['cover_image_url'] as String?,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  platforms: (json['platforms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'developer': instance.developer,
      'publisher': instance.publisher,
      'release_date': instance.releaseDate?.toIso8601String(),
      'cover_image_url': instance.coverImageUrl,
      'genres': instance.genres,
      'platforms': instance.platforms,
    };
