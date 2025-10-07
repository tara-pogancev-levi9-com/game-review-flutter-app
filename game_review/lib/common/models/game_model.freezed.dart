// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameModel {

 String get id; String get title; List<String>? get genres; String? get platforms; String? get description; String? get developer; String? get publisher;@JsonKey(name: 'release_date') DateTime? get releaseDate;@JsonKey(name: 'cover_image_url') String? get coverImageUrl;
/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModelCopyWith<GameModel> get copyWith => _$GameModelCopyWithImpl<GameModel>(this as GameModel, _$identity);

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.platforms, platforms) || other.platforms == platforms)&&(identical(other.description, description) || other.description == description)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(genres),platforms,description,developer,publisher,releaseDate,coverImageUrl);

@override
String toString() {
  return 'GameModel(id: $id, title: $title, genres: $genres, platforms: $platforms, description: $description, developer: $developer, publisher: $publisher, releaseDate: $releaseDate, coverImageUrl: $coverImageUrl)';
}


}

/// @nodoc
abstract mixin class $GameModelCopyWith<$Res>  {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) _then) = _$GameModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<String>? genres, String? platforms, String? description, String? developer, String? publisher,@JsonKey(name: 'release_date') DateTime? releaseDate,@JsonKey(name: 'cover_image_url') String? coverImageUrl
});




}
/// @nodoc
class _$GameModelCopyWithImpl<$Res>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._self, this._then);

  final GameModel _self;
  final $Res Function(GameModel) _then;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? genres = freezed,Object? platforms = freezed,Object? description = freezed,Object? developer = freezed,Object? publisher = freezed,Object? releaseDate = freezed,Object? coverImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,platforms: freezed == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModel].
extension GameModelPatterns on GameModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModel value)  $default,){
final _that = this;
switch (_that) {
case _GameModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModel value)?  $default,){
final _that = this;
switch (_that) {
case _GameModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<String>? genres,  String? platforms,  String? description,  String? developer,  String? publisher, @JsonKey(name: 'release_date')  DateTime? releaseDate, @JsonKey(name: 'cover_image_url')  String? coverImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that.id,_that.title,_that.genres,_that.platforms,_that.description,_that.developer,_that.publisher,_that.releaseDate,_that.coverImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<String>? genres,  String? platforms,  String? description,  String? developer,  String? publisher, @JsonKey(name: 'release_date')  DateTime? releaseDate, @JsonKey(name: 'cover_image_url')  String? coverImageUrl)  $default,) {final _that = this;
switch (_that) {
case _GameModel():
return $default(_that.id,_that.title,_that.genres,_that.platforms,_that.description,_that.developer,_that.publisher,_that.releaseDate,_that.coverImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<String>? genres,  String? platforms,  String? description,  String? developer,  String? publisher, @JsonKey(name: 'release_date')  DateTime? releaseDate, @JsonKey(name: 'cover_image_url')  String? coverImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that.id,_that.title,_that.genres,_that.platforms,_that.description,_that.developer,_that.publisher,_that.releaseDate,_that.coverImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameModel implements GameModel {
  const _GameModel({required this.id, required this.title, final  List<String>? genres, this.platforms, this.description, this.developer, this.publisher, @JsonKey(name: 'release_date') this.releaseDate, @JsonKey(name: 'cover_image_url') this.coverImageUrl}): _genres = genres;
  factory _GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

@override final  String id;
@override final  String title;
 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? platforms;
@override final  String? description;
@override final  String? developer;
@override final  String? publisher;
@override@JsonKey(name: 'release_date') final  DateTime? releaseDate;
@override@JsonKey(name: 'cover_image_url') final  String? coverImageUrl;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModelCopyWith<_GameModel> get copyWith => __$GameModelCopyWithImpl<_GameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.platforms, platforms) || other.platforms == platforms)&&(identical(other.description, description) || other.description == description)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_genres),platforms,description,developer,publisher,releaseDate,coverImageUrl);

@override
String toString() {
  return 'GameModel(id: $id, title: $title, genres: $genres, platforms: $platforms, description: $description, developer: $developer, publisher: $publisher, releaseDate: $releaseDate, coverImageUrl: $coverImageUrl)';
}


}

/// @nodoc
abstract mixin class _$GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$GameModelCopyWith(_GameModel value, $Res Function(_GameModel) _then) = __$GameModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<String>? genres, String? platforms, String? description, String? developer, String? publisher,@JsonKey(name: 'release_date') DateTime? releaseDate,@JsonKey(name: 'cover_image_url') String? coverImageUrl
});




}
/// @nodoc
class __$GameModelCopyWithImpl<$Res>
    implements _$GameModelCopyWith<$Res> {
  __$GameModelCopyWithImpl(this._self, this._then);

  final _GameModel _self;
  final $Res Function(_GameModel) _then;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? genres = freezed,Object? platforms = freezed,Object? description = freezed,Object? developer = freezed,Object? publisher = freezed,Object? releaseDate = freezed,Object? coverImageUrl = freezed,}) {
  return _then(_GameModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,platforms: freezed == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
