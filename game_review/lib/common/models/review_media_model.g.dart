// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewMediaModel _$ReviewMediaModelFromJson(Map<String, dynamic> json) =>
    _ReviewMediaModel(
      id: json['id'] as String,
      reviewId: json['review_id'] as String,
      mediaType: json['media_type'] as String,
      mediaUrl: json['media_url'] as String,
    );

Map<String, dynamic> _$ReviewMediaModelToJson(_ReviewMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'review_id': instance.reviewId,
      'media_type': instance.mediaType,
      'media_url': instance.mediaUrl,
    };
