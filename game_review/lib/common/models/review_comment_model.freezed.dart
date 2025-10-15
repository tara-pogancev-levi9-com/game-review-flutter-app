// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewCommentModel {

 String get id; String get userId; String get reviewId; String? get parentCommentId; String get content; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ReviewCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCommentModelCopyWith<ReviewCommentModel> get copyWith => _$ReviewCommentModelCopyWithImpl<ReviewCommentModel>(this as ReviewCommentModel, _$identity);

  /// Serializes this ReviewCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,reviewId,parentCommentId,content,createdAt,updatedAt);

@override
String toString() {
  return 'ReviewCommentModel(id: $id, userId: $userId, reviewId: $reviewId, parentCommentId: $parentCommentId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReviewCommentModelCopyWith<$Res>  {
  factory $ReviewCommentModelCopyWith(ReviewCommentModel value, $Res Function(ReviewCommentModel) _then) = _$ReviewCommentModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String reviewId, String? parentCommentId, String content, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ReviewCommentModelCopyWithImpl<$Res>
    implements $ReviewCommentModelCopyWith<$Res> {
  _$ReviewCommentModelCopyWithImpl(this._self, this._then);

  final ReviewCommentModel _self;
  final $Res Function(ReviewCommentModel) _then;

/// Create a copy of ReviewCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? reviewId = null,Object? parentCommentId = freezed,Object? content = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewCommentModel].
extension ReviewCommentModelPatterns on ReviewCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String reviewId,  String? parentCommentId,  String content,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewCommentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String reviewId,  String? parentCommentId,  String content,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewCommentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String reviewId,  String? parentCommentId,  String content,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewCommentModel() when $default != null:
return $default(_that.id,_that.userId,_that.reviewId,_that.parentCommentId,_that.content,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ReviewCommentModel implements ReviewCommentModel {
  const _ReviewCommentModel({required this.id, required this.userId, required this.reviewId, this.parentCommentId, required this.content, this.createdAt, this.updatedAt});
  factory _ReviewCommentModel.fromJson(Map<String, dynamic> json) => _$ReviewCommentModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String reviewId;
@override final  String? parentCommentId;
@override final  String content;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ReviewCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCommentModelCopyWith<_ReviewCommentModel> get copyWith => __$ReviewCommentModelCopyWithImpl<_ReviewCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,reviewId,parentCommentId,content,createdAt,updatedAt);

@override
String toString() {
  return 'ReviewCommentModel(id: $id, userId: $userId, reviewId: $reviewId, parentCommentId: $parentCommentId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewCommentModelCopyWith<$Res> implements $ReviewCommentModelCopyWith<$Res> {
  factory _$ReviewCommentModelCopyWith(_ReviewCommentModel value, $Res Function(_ReviewCommentModel) _then) = __$ReviewCommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String reviewId, String? parentCommentId, String content, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ReviewCommentModelCopyWithImpl<$Res>
    implements _$ReviewCommentModelCopyWith<$Res> {
  __$ReviewCommentModelCopyWithImpl(this._self, this._then);

  final _ReviewCommentModel _self;
  final $Res Function(_ReviewCommentModel) _then;

/// Create a copy of ReviewCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? reviewId = null,Object? parentCommentId = freezed,Object? content = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReviewCommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
