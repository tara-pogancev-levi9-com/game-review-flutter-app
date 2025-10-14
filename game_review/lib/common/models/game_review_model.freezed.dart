// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameReviewModel {

 String get id; String get userId; String get gameId; String? get title; String? get content; double? get overallRating; double? get gameplayRating; double? get graphicsRating; double? get storyRating; double? get soundRating; double? get valueRating; List<String>? get pros; List<String>? get cons; int? get playtimeHours; String? get completionStatus; bool? get recommended; DateTime? get createdAt; DateTime? get updatedAt; bool? get isLiked; int? get likesCount;
/// Create a copy of GameReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameReviewModelCopyWith<GameReviewModel> get copyWith => _$GameReviewModelCopyWithImpl<GameReviewModel>(this as GameReviewModel, _$identity);

  /// Serializes this GameReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.overallRating, overallRating) || other.overallRating == overallRating)&&(identical(other.gameplayRating, gameplayRating) || other.gameplayRating == gameplayRating)&&(identical(other.graphicsRating, graphicsRating) || other.graphicsRating == graphicsRating)&&(identical(other.storyRating, storyRating) || other.storyRating == storyRating)&&(identical(other.soundRating, soundRating) || other.soundRating == soundRating)&&(identical(other.valueRating, valueRating) || other.valueRating == valueRating)&&const DeepCollectionEquality().equals(other.pros, pros)&&const DeepCollectionEquality().equals(other.cons, cons)&&(identical(other.playtimeHours, playtimeHours) || other.playtimeHours == playtimeHours)&&(identical(other.completionStatus, completionStatus) || other.completionStatus == completionStatus)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,gameId,title,content,overallRating,gameplayRating,graphicsRating,storyRating,soundRating,valueRating,const DeepCollectionEquality().hash(pros),const DeepCollectionEquality().hash(cons),playtimeHours,completionStatus,recommended,createdAt,updatedAt,isLiked,likesCount]);

@override
String toString() {
  return 'GameReviewModel(id: $id, userId: $userId, gameId: $gameId, title: $title, content: $content, overallRating: $overallRating, gameplayRating: $gameplayRating, graphicsRating: $graphicsRating, storyRating: $storyRating, soundRating: $soundRating, valueRating: $valueRating, pros: $pros, cons: $cons, playtimeHours: $playtimeHours, completionStatus: $completionStatus, recommended: $recommended, createdAt: $createdAt, updatedAt: $updatedAt, isLiked: $isLiked, likesCount: $likesCount)';
}


}

/// @nodoc
abstract mixin class $GameReviewModelCopyWith<$Res>  {
  factory $GameReviewModelCopyWith(GameReviewModel value, $Res Function(GameReviewModel) _then) = _$GameReviewModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String gameId, String? title, String? content, double? overallRating, double? gameplayRating, double? graphicsRating, double? storyRating, double? soundRating, double? valueRating, List<String>? pros, List<String>? cons, int? playtimeHours, String? completionStatus, bool? recommended, DateTime? createdAt, DateTime? updatedAt, bool? isLiked, int? likesCount
});




}
/// @nodoc
class _$GameReviewModelCopyWithImpl<$Res>
    implements $GameReviewModelCopyWith<$Res> {
  _$GameReviewModelCopyWithImpl(this._self, this._then);

  final GameReviewModel _self;
  final $Res Function(GameReviewModel) _then;

/// Create a copy of GameReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? title = freezed,Object? content = freezed,Object? overallRating = freezed,Object? gameplayRating = freezed,Object? graphicsRating = freezed,Object? storyRating = freezed,Object? soundRating = freezed,Object? valueRating = freezed,Object? pros = freezed,Object? cons = freezed,Object? playtimeHours = freezed,Object? completionStatus = freezed,Object? recommended = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isLiked = freezed,Object? likesCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,overallRating: freezed == overallRating ? _self.overallRating : overallRating // ignore: cast_nullable_to_non_nullable
as double?,gameplayRating: freezed == gameplayRating ? _self.gameplayRating : gameplayRating // ignore: cast_nullable_to_non_nullable
as double?,graphicsRating: freezed == graphicsRating ? _self.graphicsRating : graphicsRating // ignore: cast_nullable_to_non_nullable
as double?,storyRating: freezed == storyRating ? _self.storyRating : storyRating // ignore: cast_nullable_to_non_nullable
as double?,soundRating: freezed == soundRating ? _self.soundRating : soundRating // ignore: cast_nullable_to_non_nullable
as double?,valueRating: freezed == valueRating ? _self.valueRating : valueRating // ignore: cast_nullable_to_non_nullable
as double?,pros: freezed == pros ? _self.pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>?,cons: freezed == cons ? _self.cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>?,playtimeHours: freezed == playtimeHours ? _self.playtimeHours : playtimeHours // ignore: cast_nullable_to_non_nullable
as int?,completionStatus: freezed == completionStatus ? _self.completionStatus : completionStatus // ignore: cast_nullable_to_non_nullable
as String?,recommended: freezed == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLiked: freezed == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameReviewModel].
extension GameReviewModelPatterns on GameReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _GameReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _GameReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  String? title,  String? content,  double? overallRating,  double? gameplayRating,  double? graphicsRating,  double? storyRating,  double? soundRating,  double? valueRating,  List<String>? pros,  List<String>? cons,  int? playtimeHours,  String? completionStatus,  bool? recommended,  DateTime? createdAt,  DateTime? updatedAt,  bool? isLiked,  int? likesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameReviewModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.title,_that.content,_that.overallRating,_that.gameplayRating,_that.graphicsRating,_that.storyRating,_that.soundRating,_that.valueRating,_that.pros,_that.cons,_that.playtimeHours,_that.completionStatus,_that.recommended,_that.createdAt,_that.updatedAt,_that.isLiked,_that.likesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String gameId,  String? title,  String? content,  double? overallRating,  double? gameplayRating,  double? graphicsRating,  double? storyRating,  double? soundRating,  double? valueRating,  List<String>? pros,  List<String>? cons,  int? playtimeHours,  String? completionStatus,  bool? recommended,  DateTime? createdAt,  DateTime? updatedAt,  bool? isLiked,  int? likesCount)  $default,) {final _that = this;
switch (_that) {
case _GameReviewModel():
return $default(_that.id,_that.userId,_that.gameId,_that.title,_that.content,_that.overallRating,_that.gameplayRating,_that.graphicsRating,_that.storyRating,_that.soundRating,_that.valueRating,_that.pros,_that.cons,_that.playtimeHours,_that.completionStatus,_that.recommended,_that.createdAt,_that.updatedAt,_that.isLiked,_that.likesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String gameId,  String? title,  String? content,  double? overallRating,  double? gameplayRating,  double? graphicsRating,  double? storyRating,  double? soundRating,  double? valueRating,  List<String>? pros,  List<String>? cons,  int? playtimeHours,  String? completionStatus,  bool? recommended,  DateTime? createdAt,  DateTime? updatedAt,  bool? isLiked,  int? likesCount)?  $default,) {final _that = this;
switch (_that) {
case _GameReviewModel() when $default != null:
return $default(_that.id,_that.userId,_that.gameId,_that.title,_that.content,_that.overallRating,_that.gameplayRating,_that.graphicsRating,_that.storyRating,_that.soundRating,_that.valueRating,_that.pros,_that.cons,_that.playtimeHours,_that.completionStatus,_that.recommended,_that.createdAt,_that.updatedAt,_that.isLiked,_that.likesCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GameReviewModel implements GameReviewModel {
  const _GameReviewModel({required this.id, required this.userId, required this.gameId, this.title, this.content, this.overallRating, this.gameplayRating, this.graphicsRating, this.storyRating, this.soundRating, this.valueRating, final  List<String>? pros, final  List<String>? cons, this.playtimeHours, this.completionStatus, this.recommended, this.createdAt, this.updatedAt, this.isLiked, this.likesCount}): _pros = pros,_cons = cons;
  factory _GameReviewModel.fromJson(Map<String, dynamic> json) => _$GameReviewModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String gameId;
@override final  String? title;
@override final  String? content;
@override final  double? overallRating;
@override final  double? gameplayRating;
@override final  double? graphicsRating;
@override final  double? storyRating;
@override final  double? soundRating;
@override final  double? valueRating;
 final  List<String>? _pros;
@override List<String>? get pros {
  final value = _pros;
  if (value == null) return null;
  if (_pros is EqualUnmodifiableListView) return _pros;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _cons;
@override List<String>? get cons {
  final value = _cons;
  if (value == null) return null;
  if (_cons is EqualUnmodifiableListView) return _cons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? playtimeHours;
@override final  String? completionStatus;
@override final  bool? recommended;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  bool? isLiked;
@override final  int? likesCount;

/// Create a copy of GameReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameReviewModelCopyWith<_GameReviewModel> get copyWith => __$GameReviewModelCopyWithImpl<_GameReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.overallRating, overallRating) || other.overallRating == overallRating)&&(identical(other.gameplayRating, gameplayRating) || other.gameplayRating == gameplayRating)&&(identical(other.graphicsRating, graphicsRating) || other.graphicsRating == graphicsRating)&&(identical(other.storyRating, storyRating) || other.storyRating == storyRating)&&(identical(other.soundRating, soundRating) || other.soundRating == soundRating)&&(identical(other.valueRating, valueRating) || other.valueRating == valueRating)&&const DeepCollectionEquality().equals(other._pros, _pros)&&const DeepCollectionEquality().equals(other._cons, _cons)&&(identical(other.playtimeHours, playtimeHours) || other.playtimeHours == playtimeHours)&&(identical(other.completionStatus, completionStatus) || other.completionStatus == completionStatus)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,gameId,title,content,overallRating,gameplayRating,graphicsRating,storyRating,soundRating,valueRating,const DeepCollectionEquality().hash(_pros),const DeepCollectionEquality().hash(_cons),playtimeHours,completionStatus,recommended,createdAt,updatedAt,isLiked,likesCount]);

@override
String toString() {
  return 'GameReviewModel(id: $id, userId: $userId, gameId: $gameId, title: $title, content: $content, overallRating: $overallRating, gameplayRating: $gameplayRating, graphicsRating: $graphicsRating, storyRating: $storyRating, soundRating: $soundRating, valueRating: $valueRating, pros: $pros, cons: $cons, playtimeHours: $playtimeHours, completionStatus: $completionStatus, recommended: $recommended, createdAt: $createdAt, updatedAt: $updatedAt, isLiked: $isLiked, likesCount: $likesCount)';
}


}

/// @nodoc
abstract mixin class _$GameReviewModelCopyWith<$Res> implements $GameReviewModelCopyWith<$Res> {
  factory _$GameReviewModelCopyWith(_GameReviewModel value, $Res Function(_GameReviewModel) _then) = __$GameReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String gameId, String? title, String? content, double? overallRating, double? gameplayRating, double? graphicsRating, double? storyRating, double? soundRating, double? valueRating, List<String>? pros, List<String>? cons, int? playtimeHours, String? completionStatus, bool? recommended, DateTime? createdAt, DateTime? updatedAt, bool? isLiked, int? likesCount
});




}
/// @nodoc
class __$GameReviewModelCopyWithImpl<$Res>
    implements _$GameReviewModelCopyWith<$Res> {
  __$GameReviewModelCopyWithImpl(this._self, this._then);

  final _GameReviewModel _self;
  final $Res Function(_GameReviewModel) _then;

/// Create a copy of GameReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? gameId = null,Object? title = freezed,Object? content = freezed,Object? overallRating = freezed,Object? gameplayRating = freezed,Object? graphicsRating = freezed,Object? storyRating = freezed,Object? soundRating = freezed,Object? valueRating = freezed,Object? pros = freezed,Object? cons = freezed,Object? playtimeHours = freezed,Object? completionStatus = freezed,Object? recommended = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isLiked = freezed,Object? likesCount = freezed,}) {
  return _then(_GameReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,overallRating: freezed == overallRating ? _self.overallRating : overallRating // ignore: cast_nullable_to_non_nullable
as double?,gameplayRating: freezed == gameplayRating ? _self.gameplayRating : gameplayRating // ignore: cast_nullable_to_non_nullable
as double?,graphicsRating: freezed == graphicsRating ? _self.graphicsRating : graphicsRating // ignore: cast_nullable_to_non_nullable
as double?,storyRating: freezed == storyRating ? _self.storyRating : storyRating // ignore: cast_nullable_to_non_nullable
as double?,soundRating: freezed == soundRating ? _self.soundRating : soundRating // ignore: cast_nullable_to_non_nullable
as double?,valueRating: freezed == valueRating ? _self.valueRating : valueRating // ignore: cast_nullable_to_non_nullable
as double?,pros: freezed == pros ? _self._pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>?,cons: freezed == cons ? _self._cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>?,playtimeHours: freezed == playtimeHours ? _self.playtimeHours : playtimeHours // ignore: cast_nullable_to_non_nullable
as int?,completionStatus: freezed == completionStatus ? _self.completionStatus : completionStatus // ignore: cast_nullable_to_non_nullable
as String?,recommended: freezed == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLiked: freezed == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
