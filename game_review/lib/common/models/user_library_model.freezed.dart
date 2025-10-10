// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_library_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLibraryModel {

 String get id; String get userId; String get gameId; String? get platformId; int get hoursPlayed; double get completionPercentage; DateTime? get lastPlayed; bool get isFavorite; DateTime? get addedAt;
/// Create a copy of UserLibraryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLibraryModelCopyWith<UserLibraryModel> get copyWith => _$UserLibraryModelCopyWithImpl<UserLibraryModel>(this as UserLibraryModel, _$identity);

  /// Serializes this UserLibraryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLibraryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.platformId, platformId) || other.platformId == platformId)&&(identical(other.hoursPlayed, hoursPlayed) || other.hoursPlayed == hoursPlayed)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,gameId,platformId,hoursPlayed,completionPercentage,lastPlayed,isFavorite,addedAt);

@override
String toString() {
  return 'UserLibraryModel(id: $id, userId: $userId, gameId: $gameId, platformId: $platformId, hoursPlayed: $hoursPlayed, completionPercentage: $completionPercentage, lastPlayed: $lastPlayed, isFavorite: $isFavorite, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class $UserLibraryModelCopyWith<$Res>  {
  factory $UserLibraryModelCopyWith(UserLibraryModel value, $Res Function(UserLibraryModel) _then) = _$UserLibraryModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String gameId, String? platformId, int hoursPlayed, double completionPercentage, DateTime? lastPlayed, bool isFavorite, DateTime? addedAt
});




}
/// @nodoc
class _$UserLibraryModelCopyWithImpl<$Res>
    implements $UserLibraryModelCopyWith<$Res> {
  _$UserLibraryModelCopyWithImpl(this._self, this._then);

  final UserLibraryModel _self;
  final $Res Function(UserLibraryModel) _then;

/// Create a copy of UserLibraryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? platformId = freezed,Object? hoursPlayed = null,Object? completionPercentage = null,Object? lastPlayed = freezed,Object? isFavorite = null,Object? addedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,platformId: freezed == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String?,hoursPlayed: null == hoursPlayed ? _self.hoursPlayed : hoursPlayed // ignore: cast_nullable_to_non_nullable
as int,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,lastPlayed: freezed == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLibraryModel].
extension UserLibraryModelPatterns on UserLibraryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLibraryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLibraryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLibraryModel value)  $default,){
final _that = this;
switch (_that) {
case _UserLibraryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLibraryModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserLibraryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  String? platformId,  int hoursPlayed,  double completionPercentage,  DateTime? lastPlayed,  bool isFavorite,  DateTime? addedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLibraryModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.platformId,_that.hoursPlayed,_that.completionPercentage,_that.lastPlayed,_that.isFavorite,_that.addedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  String? platformId,  int hoursPlayed,  double completionPercentage,  DateTime? lastPlayed,  bool isFavorite,  DateTime? addedAt)  $default,) {final _that = this;
switch (_that) {
case _UserLibraryModel():
return $default(_that.id,_that.userId,_that.gameId,_that.platformId,_that.hoursPlayed,_that.completionPercentage,_that.lastPlayed,_that.isFavorite,_that.addedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String gameId,  String? platformId,  int hoursPlayed,  double completionPercentage,  DateTime? lastPlayed,  bool isFavorite,  DateTime? addedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserLibraryModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.platformId,_that.hoursPlayed,_that.completionPercentage,_that.lastPlayed,_that.isFavorite,_that.addedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UserLibraryModel implements UserLibraryModel {
  const _UserLibraryModel({required this.id, required this.userId, required this.gameId, this.platformId, required this.hoursPlayed, required this.completionPercentage, this.lastPlayed, required this.isFavorite, this.addedAt});
  factory _UserLibraryModel.fromJson(Map<String, dynamic> json) => _$UserLibraryModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String gameId;
@override final  String? platformId;
@override final  int hoursPlayed;
@override final  double completionPercentage;
@override final  DateTime? lastPlayed;
@override final  bool isFavorite;
@override final  DateTime? addedAt;

/// Create a copy of UserLibraryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLibraryModelCopyWith<_UserLibraryModel> get copyWith => __$UserLibraryModelCopyWithImpl<_UserLibraryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLibraryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLibraryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.platformId, platformId) || other.platformId == platformId)&&(identical(other.hoursPlayed, hoursPlayed) || other.hoursPlayed == hoursPlayed)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,gameId,platformId,hoursPlayed,completionPercentage,lastPlayed,isFavorite,addedAt);

@override
String toString() {
  return 'UserLibraryModel(id: $id, userId: $userId, gameId: $gameId, platformId: $platformId, hoursPlayed: $hoursPlayed, completionPercentage: $completionPercentage, lastPlayed: $lastPlayed, isFavorite: $isFavorite, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class _$UserLibraryModelCopyWith<$Res> implements $UserLibraryModelCopyWith<$Res> {
  factory _$UserLibraryModelCopyWith(_UserLibraryModel value, $Res Function(_UserLibraryModel) _then) = __$UserLibraryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String gameId, String? platformId, int hoursPlayed, double completionPercentage, DateTime? lastPlayed, bool isFavorite, DateTime? addedAt
});




}
/// @nodoc
class __$UserLibraryModelCopyWithImpl<$Res>
    implements _$UserLibraryModelCopyWith<$Res> {
  __$UserLibraryModelCopyWithImpl(this._self, this._then);

  final _UserLibraryModel _self;
  final $Res Function(_UserLibraryModel) _then;

/// Create a copy of UserLibraryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? platformId = freezed,Object? hoursPlayed = null,Object? completionPercentage = null,Object? lastPlayed = freezed,Object? isFavorite = null,Object? addedAt = freezed,}) {
  return _then(_UserLibraryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,platformId: freezed == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String?,hoursPlayed: null == hoursPlayed ? _self.hoursPlayed : hoursPlayed // ignore: cast_nullable_to_non_nullable
as int,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,lastPlayed: freezed == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
