// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {

 String get id; String get user_id; String get game_id; String? get title; String? get content; double? get overall_rating; double? get gameplay_rating; double? get graphics_rating; double? get story_rating; double? get sound_rating; double? get value_rating; List<String>? get pros; List<String>? get cons; int? get playtime_hours; String? get completion_status; bool? get recommended; DateTime? get created_at; DateTime? get updated_at;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.game_id, game_id) || other.game_id == game_id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.overall_rating, overall_rating) || other.overall_rating == overall_rating)&&(identical(other.gameplay_rating, gameplay_rating) || other.gameplay_rating == gameplay_rating)&&(identical(other.graphics_rating, graphics_rating) || other.graphics_rating == graphics_rating)&&(identical(other.story_rating, story_rating) || other.story_rating == story_rating)&&(identical(other.sound_rating, sound_rating) || other.sound_rating == sound_rating)&&(identical(other.value_rating, value_rating) || other.value_rating == value_rating)&&const DeepCollectionEquality().equals(other.pros, pros)&&const DeepCollectionEquality().equals(other.cons, cons)&&(identical(other.playtime_hours, playtime_hours) || other.playtime_hours == playtime_hours)&&(identical(other.completion_status, completion_status) || other.completion_status == completion_status)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user_id,game_id,title,content,overall_rating,gameplay_rating,graphics_rating,story_rating,sound_rating,value_rating,const DeepCollectionEquality().hash(pros),const DeepCollectionEquality().hash(cons),playtime_hours,completion_status,recommended,created_at,updated_at);

@override
String toString() {
  return 'ReviewModel(id: $id, user_id: $user_id, game_id: $game_id, title: $title, content: $content, overall_rating: $overall_rating, gameplay_rating: $gameplay_rating, graphics_rating: $graphics_rating, story_rating: $story_rating, sound_rating: $sound_rating, value_rating: $value_rating, pros: $pros, cons: $cons, playtime_hours: $playtime_hours, completion_status: $completion_status, recommended: $recommended, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 String id, String user_id, String game_id, String? title, String? content, double? overall_rating, double? gameplay_rating, double? graphics_rating, double? story_rating, double? sound_rating, double? value_rating, List<String>? pros, List<String>? cons, int? playtime_hours, String? completion_status, bool? recommended, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user_id = null,Object? game_id = null,Object? title = freezed,Object? content = freezed,Object? overall_rating = freezed,Object? gameplay_rating = freezed,Object? graphics_rating = freezed,Object? story_rating = freezed,Object? sound_rating = freezed,Object? value_rating = freezed,Object? pros = freezed,Object? cons = freezed,Object? playtime_hours = freezed,Object? completion_status = freezed,Object? recommended = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String,game_id: null == game_id ? _self.game_id : game_id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,overall_rating: freezed == overall_rating ? _self.overall_rating : overall_rating // ignore: cast_nullable_to_non_nullable
as double?,gameplay_rating: freezed == gameplay_rating ? _self.gameplay_rating : gameplay_rating // ignore: cast_nullable_to_non_nullable
as double?,graphics_rating: freezed == graphics_rating ? _self.graphics_rating : graphics_rating // ignore: cast_nullable_to_non_nullable
as double?,story_rating: freezed == story_rating ? _self.story_rating : story_rating // ignore: cast_nullable_to_non_nullable
as double?,sound_rating: freezed == sound_rating ? _self.sound_rating : sound_rating // ignore: cast_nullable_to_non_nullable
as double?,value_rating: freezed == value_rating ? _self.value_rating : value_rating // ignore: cast_nullable_to_non_nullable
as double?,pros: freezed == pros ? _self.pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>?,cons: freezed == cons ? _self.cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>?,playtime_hours: freezed == playtime_hours ? _self.playtime_hours : playtime_hours // ignore: cast_nullable_to_non_nullable
as int?,completion_status: freezed == completion_status ? _self.completion_status : completion_status // ignore: cast_nullable_to_non_nullable
as String?,recommended: freezed == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String user_id,  String game_id,  String? title,  String? content,  double? overall_rating,  double? gameplay_rating,  double? graphics_rating,  double? story_rating,  double? sound_rating,  double? value_rating,  List<String>? pros,  List<String>? cons,  int? playtime_hours,  String? completion_status,  bool? recommended,  DateTime? created_at,  DateTime? updated_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.id,_that.user_id,_that.game_id,_that.title,_that.content,_that.overall_rating,_that.gameplay_rating,_that.graphics_rating,_that.story_rating,_that.sound_rating,_that.value_rating,_that.pros,_that.cons,_that.playtime_hours,_that.completion_status,_that.recommended,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String user_id,  String game_id,  String? title,  String? content,  double? overall_rating,  double? gameplay_rating,  double? graphics_rating,  double? story_rating,  double? sound_rating,  double? value_rating,  List<String>? pros,  List<String>? cons,  int? playtime_hours,  String? completion_status,  bool? recommended,  DateTime? created_at,  DateTime? updated_at)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that.id,_that.user_id,_that.game_id,_that.title,_that.content,_that.overall_rating,_that.gameplay_rating,_that.graphics_rating,_that.story_rating,_that.sound_rating,_that.value_rating,_that.pros,_that.cons,_that.playtime_hours,_that.completion_status,_that.recommended,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String user_id,  String game_id,  String? title,  String? content,  double? overall_rating,  double? gameplay_rating,  double? graphics_rating,  double? story_rating,  double? sound_rating,  double? value_rating,  List<String>? pros,  List<String>? cons,  int? playtime_hours,  String? completion_status,  bool? recommended,  DateTime? created_at,  DateTime? updated_at)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.id,_that.user_id,_that.game_id,_that.title,_that.content,_that.overall_rating,_that.gameplay_rating,_that.graphics_rating,_that.story_rating,_that.sound_rating,_that.value_rating,_that.pros,_that.cons,_that.playtime_hours,_that.completion_status,_that.recommended,_that.created_at,_that.updated_at);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ReviewModel implements ReviewModel {
  const _ReviewModel({required this.id, required this.user_id, required this.game_id, this.title, this.content, this.overall_rating, this.gameplay_rating, this.graphics_rating, this.story_rating, this.sound_rating, this.value_rating, final  List<String>? pros, final  List<String>? cons, this.playtime_hours, this.completion_status, this.recommended, this.created_at, this.updated_at}): _pros = pros,_cons = cons;
  factory _ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

@override final  String id;
@override final  String user_id;
@override final  String game_id;
@override final  String? title;
@override final  String? content;
@override final  double? overall_rating;
@override final  double? gameplay_rating;
@override final  double? graphics_rating;
@override final  double? story_rating;
@override final  double? sound_rating;
@override final  double? value_rating;
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

@override final  int? playtime_hours;
@override final  String? completion_status;
@override final  bool? recommended;
@override final  DateTime? created_at;
@override final  DateTime? updated_at;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.game_id, game_id) || other.game_id == game_id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.overall_rating, overall_rating) || other.overall_rating == overall_rating)&&(identical(other.gameplay_rating, gameplay_rating) || other.gameplay_rating == gameplay_rating)&&(identical(other.graphics_rating, graphics_rating) || other.graphics_rating == graphics_rating)&&(identical(other.story_rating, story_rating) || other.story_rating == story_rating)&&(identical(other.sound_rating, sound_rating) || other.sound_rating == sound_rating)&&(identical(other.value_rating, value_rating) || other.value_rating == value_rating)&&const DeepCollectionEquality().equals(other._pros, _pros)&&const DeepCollectionEquality().equals(other._cons, _cons)&&(identical(other.playtime_hours, playtime_hours) || other.playtime_hours == playtime_hours)&&(identical(other.completion_status, completion_status) || other.completion_status == completion_status)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user_id,game_id,title,content,overall_rating,gameplay_rating,graphics_rating,story_rating,sound_rating,value_rating,const DeepCollectionEquality().hash(_pros),const DeepCollectionEquality().hash(_cons),playtime_hours,completion_status,recommended,created_at,updated_at);

@override
String toString() {
  return 'ReviewModel(id: $id, user_id: $user_id, game_id: $game_id, title: $title, content: $content, overall_rating: $overall_rating, gameplay_rating: $gameplay_rating, graphics_rating: $graphics_rating, story_rating: $story_rating, sound_rating: $sound_rating, value_rating: $value_rating, pros: $pros, cons: $cons, playtime_hours: $playtime_hours, completion_status: $completion_status, recommended: $recommended, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String user_id, String game_id, String? title, String? content, double? overall_rating, double? gameplay_rating, double? graphics_rating, double? story_rating, double? sound_rating, double? value_rating, List<String>? pros, List<String>? cons, int? playtime_hours, String? completion_status, bool? recommended, DateTime? created_at, DateTime? updated_at
});




}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user_id = null,Object? game_id = null,Object? title = freezed,Object? content = freezed,Object? overall_rating = freezed,Object? gameplay_rating = freezed,Object? graphics_rating = freezed,Object? story_rating = freezed,Object? sound_rating = freezed,Object? value_rating = freezed,Object? pros = freezed,Object? cons = freezed,Object? playtime_hours = freezed,Object? completion_status = freezed,Object? recommended = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_ReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String,game_id: null == game_id ? _self.game_id : game_id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,overall_rating: freezed == overall_rating ? _self.overall_rating : overall_rating // ignore: cast_nullable_to_non_nullable
as double?,gameplay_rating: freezed == gameplay_rating ? _self.gameplay_rating : gameplay_rating // ignore: cast_nullable_to_non_nullable
as double?,graphics_rating: freezed == graphics_rating ? _self.graphics_rating : graphics_rating // ignore: cast_nullable_to_non_nullable
as double?,story_rating: freezed == story_rating ? _self.story_rating : story_rating // ignore: cast_nullable_to_non_nullable
as double?,sound_rating: freezed == sound_rating ? _self.sound_rating : sound_rating // ignore: cast_nullable_to_non_nullable
as double?,value_rating: freezed == value_rating ? _self.value_rating : value_rating // ignore: cast_nullable_to_non_nullable
as double?,pros: freezed == pros ? _self._pros : pros // ignore: cast_nullable_to_non_nullable
as List<String>?,cons: freezed == cons ? _self._cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>?,playtime_hours: freezed == playtime_hours ? _self.playtime_hours : playtime_hours // ignore: cast_nullable_to_non_nullable
as int?,completion_status: freezed == completion_status ? _self.completion_status : completion_status // ignore: cast_nullable_to_non_nullable
as String?,recommended: freezed == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
