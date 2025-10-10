// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewCommentModel _$ReviewCommentModelFromJson(Map<String, dynamic> json) =>
    _ReviewCommentModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      reviewId: json['review_id'] as String,
      parentCommentId: json['parent_comment_id'] as String?,
      content: json['content'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ReviewCommentModelToJson(_ReviewCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'review_id': instance.reviewId,
      'parent_comment_id': instance.parentCommentId,
      'content': instance.content,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
