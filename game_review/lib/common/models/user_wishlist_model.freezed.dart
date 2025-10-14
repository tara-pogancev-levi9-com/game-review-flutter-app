// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_wishlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserWishlistModel {

 String get id; String get userId; String get gameId; int? get priority; DateTime? get addedAt;
/// Create a copy of UserWishlistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWishlistModelCopyWith<UserWishlistModel> get copyWith => _$UserWishlistModelCopyWithImpl<UserWishlistModel>(this as UserWishlistModel, _$identity);

  /// Serializes this UserWishlistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWishlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,gameId,priority,addedAt);

@override
String toString() {
  return 'UserWishlistModel(id: $id, userId: $userId, gameId: $gameId, priority: $priority, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class $UserWishlistModelCopyWith<$Res>  {
  factory $UserWishlistModelCopyWith(UserWishlistModel value, $Res Function(UserWishlistModel) _then) = _$UserWishlistModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String gameId, int? priority, DateTime? addedAt
});




}
/// @nodoc
class _$UserWishlistModelCopyWithImpl<$Res>
    implements $UserWishlistModelCopyWith<$Res> {
  _$UserWishlistModelCopyWithImpl(this._self, this._then);

  final UserWishlistModel _self;
  final $Res Function(UserWishlistModel) _then;

/// Create a copy of UserWishlistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? priority = freezed,Object? addedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserWishlistModel].
extension UserWishlistModelPatterns on UserWishlistModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserWishlistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserWishlistModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserWishlistModel value)  $default,){
final _that = this;
switch (_that) {
case _UserWishlistModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserWishlistModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserWishlistModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  int? priority,  DateTime? addedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWishlistModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.priority,_that.addedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  int? priority,  DateTime? addedAt)  $default,) {final _that = this;
switch (_that) {
case _UserWishlistModel():
return $default(_that.id,_that.userId,_that.gameId,_that.priority,_that.addedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String gameId,  int? priority,  DateTime? addedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserWishlistModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.priority,_that.addedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UserWishlistModel implements UserWishlistModel {
  const _UserWishlistModel({required this.id, required this.userId, required this.gameId, this.priority, this.addedAt});
  factory _UserWishlistModel.fromJson(Map<String, dynamic> json) => _$UserWishlistModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String gameId;
@override final  int? priority;
@override final  DateTime? addedAt;

/// Create a copy of UserWishlistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserWishlistModelCopyWith<_UserWishlistModel> get copyWith => __$UserWishlistModelCopyWithImpl<_UserWishlistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWishlistModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWishlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,gameId,priority,addedAt);

@override
String toString() {
  return 'UserWishlistModel(id: $id, userId: $userId, gameId: $gameId, priority: $priority, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class _$UserWishlistModelCopyWith<$Res> implements $UserWishlistModelCopyWith<$Res> {
  factory _$UserWishlistModelCopyWith(_UserWishlistModel value, $Res Function(_UserWishlistModel) _then) = __$UserWishlistModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String gameId, int? priority, DateTime? addedAt
});




}
/// @nodoc
class __$UserWishlistModelCopyWithImpl<$Res>
    implements _$UserWishlistModelCopyWith<$Res> {
  __$UserWishlistModelCopyWithImpl(this._self, this._then);

  final _UserWishlistModel _self;
  final $Res Function(_UserWishlistModel) _then;

/// Create a copy of UserWishlistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? priority = freezed,Object? addedAt = freezed,}) {
  return _then(_UserWishlistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
