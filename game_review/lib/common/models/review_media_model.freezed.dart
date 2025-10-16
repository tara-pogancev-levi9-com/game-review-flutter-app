// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewMediaModel {

 String get id; String get reviewId; String get mediaType; String get mediaUrl;
/// Create a copy of ReviewMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewMediaModelCopyWith<ReviewMediaModel> get copyWith => _$ReviewMediaModelCopyWithImpl<ReviewMediaModel>(this as ReviewMediaModel, _$identity);

  /// Serializes this ReviewMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewId,mediaType,mediaUrl);

@override
String toString() {
  return 'ReviewMediaModel(id: $id, reviewId: $reviewId, mediaType: $mediaType, mediaUrl: $mediaUrl)';
}


}

/// @nodoc
abstract mixin class $ReviewMediaModelCopyWith<$Res>  {
  factory $ReviewMediaModelCopyWith(ReviewMediaModel value, $Res Function(ReviewMediaModel) _then) = _$ReviewMediaModelCopyWithImpl;
@useResult
$Res call({
 String id, String reviewId, String mediaType, String mediaUrl
});




}
/// @nodoc
class _$ReviewMediaModelCopyWithImpl<$Res>
    implements $ReviewMediaModelCopyWith<$Res> {
  _$ReviewMediaModelCopyWithImpl(this._self, this._then);

  final ReviewMediaModel _self;
  final $Res Function(ReviewMediaModel) _then;

/// Create a copy of ReviewMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reviewId = null,Object? mediaType = null,Object? mediaUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewMediaModel].
extension ReviewMediaModelPatterns on ReviewMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reviewId,  String mediaType,  String mediaUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewMediaModel() when $default != null:
return $default(_that.id,_that.reviewId,_that.mediaType,_that.mediaUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reviewId,  String mediaType,  String mediaUrl)  $default,) {final _that = this;
switch (_that) {
case _ReviewMediaModel():
return $default(_that.id,_that.reviewId,_that.mediaType,_that.mediaUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reviewId,  String mediaType,  String mediaUrl)?  $default,) {final _that = this;
switch (_that) {
case _ReviewMediaModel() when $default != null:
return $default(_that.id,_that.reviewId,_that.mediaType,_that.mediaUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ReviewMediaModel implements ReviewMediaModel {
  const _ReviewMediaModel({required this.id, required this.reviewId, required this.mediaType, required this.mediaUrl});
  factory _ReviewMediaModel.fromJson(Map<String, dynamic> json) => _$ReviewMediaModelFromJson(json);

@override final  String id;
@override final  String reviewId;
@override final  String mediaType;
@override final  String mediaUrl;

/// Create a copy of ReviewMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewMediaModelCopyWith<_ReviewMediaModel> get copyWith => __$ReviewMediaModelCopyWithImpl<_ReviewMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewId,mediaType,mediaUrl);

@override
String toString() {
  return 'ReviewMediaModel(id: $id, reviewId: $reviewId, mediaType: $mediaType, mediaUrl: $mediaUrl)';
}


}

/// @nodoc
abstract mixin class _$ReviewMediaModelCopyWith<$Res> implements $ReviewMediaModelCopyWith<$Res> {
  factory _$ReviewMediaModelCopyWith(_ReviewMediaModel value, $Res Function(_ReviewMediaModel) _then) = __$ReviewMediaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String reviewId, String mediaType, String mediaUrl
});




}
/// @nodoc
class __$ReviewMediaModelCopyWithImpl<$Res>
    implements _$ReviewMediaModelCopyWith<$Res> {
  __$ReviewMediaModelCopyWithImpl(this._self, this._then);

  final _ReviewMediaModel _self;
  final $Res Function(_ReviewMediaModel) _then;

/// Create a copy of ReviewMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reviewId = null,Object? mediaType = null,Object? mediaUrl = null,}) {
  return _then(_ReviewMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
