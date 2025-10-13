// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewComment {

 String get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'review_id') String? get reviewId;@JsonKey(name: 'parent_comment_id') String? get parentCommentId; String? get content;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ReviewComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCommentCopyWith<ReviewComment> get copyWith => _$ReviewCommentCopyWithImpl<ReviewComment>(this as ReviewComment, _$identity);

  /// Serializes this ReviewComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewComment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,reviewId,parentCommentId,content,createdAt,updatedAt);

@override
String toString() {
  return 'ReviewComment(id: $id, userId: $userId, reviewId: $reviewId, parentCommentId: $parentCommentId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReviewCommentCopyWith<$Res>  {
  factory $ReviewCommentCopyWith(ReviewComment value, $Res Function(ReviewComment) _then) = _$ReviewCommentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'review_id') String? reviewId,@JsonKey(name: 'parent_comment_id') String? parentCommentId, String? content,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ReviewCommentCopyWithImpl<$Res>
    implements $ReviewCommentCopyWith<$Res> {
  _$ReviewCommentCopyWithImpl(this._self, this._then);

  final ReviewComment _self;
  final $Res Function(ReviewComment) _then;

/// Create a copy of ReviewComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? reviewId = freezed,Object? parentCommentId = freezed,Object? content = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,reviewId: freezed == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String?,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewComment].
extension ReviewCommentPatterns on ReviewComment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewComment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewComment value)  $default,){
final _that = this;
switch (_that) {
case _ReviewComment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewComment value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewComment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'review_id')  String? reviewId, @JsonKey(name: 'parent_comment_id')  String? parentCommentId,  String? content, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewComment() when $default != null:
return $default(_that.id,_that.userId,_that.reviewId,_that.parentCommentId,_that.content,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'review_id')  String? reviewId, @JsonKey(name: 'parent_comment_id')  String? parentCommentId,  String? content, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewComment():
return $default(_that.id,_that.userId,_that.reviewId,_that.parentCommentId,_that.content,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'review_id')  String? reviewId, @JsonKey(name: 'parent_comment_id')  String? parentCommentId,  String? content, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewComment() when $default != null:
return $default(_that.id,_that.userId,_that.reviewId,_that.parentCommentId,_that.content,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewComment implements ReviewComment {
  const _ReviewComment({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'review_id') this.reviewId, @JsonKey(name: 'parent_comment_id') this.parentCommentId, this.content, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ReviewComment.fromJson(Map<String, dynamic> json) => _$ReviewCommentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'review_id') final  String? reviewId;
@override@JsonKey(name: 'parent_comment_id') final  String? parentCommentId;
@override final  String? content;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ReviewComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCommentCopyWith<_ReviewComment> get copyWith => __$ReviewCommentCopyWithImpl<_ReviewComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewComment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,reviewId,parentCommentId,content,createdAt,updatedAt);

@override
String toString() {
  return 'ReviewComment(id: $id, userId: $userId, reviewId: $reviewId, parentCommentId: $parentCommentId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewCommentCopyWith<$Res> implements $ReviewCommentCopyWith<$Res> {
  factory _$ReviewCommentCopyWith(_ReviewComment value, $Res Function(_ReviewComment) _then) = __$ReviewCommentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'review_id') String? reviewId,@JsonKey(name: 'parent_comment_id') String? parentCommentId, String? content,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ReviewCommentCopyWithImpl<$Res>
    implements _$ReviewCommentCopyWith<$Res> {
  __$ReviewCommentCopyWithImpl(this._self, this._then);

  final _ReviewComment _self;
  final $Res Function(_ReviewComment) _then;

/// Create a copy of ReviewComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? reviewId = freezed,Object? parentCommentId = freezed,Object? content = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReviewComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,reviewId: freezed == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String?,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
