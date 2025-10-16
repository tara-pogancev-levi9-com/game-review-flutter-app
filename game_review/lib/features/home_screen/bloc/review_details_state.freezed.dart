// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewDetailsState()';
}


}

/// @nodoc
class $ReviewDetailsStateCopyWith<$Res>  {
$ReviewDetailsStateCopyWith(ReviewDetailsState _, $Res Function(ReviewDetailsState) __);
}


/// Adds pattern-matching-related methods to [ReviewDetailsState].
extension ReviewDetailsStatePatterns on ReviewDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReviewDetailsLoading value)?  loading,TResult Function( ReviewDetailsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReviewDetailsLoading() when loading != null:
return loading(_that);case ReviewDetailsLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReviewDetailsLoading value)  loading,required TResult Function( ReviewDetailsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case ReviewDetailsLoading():
return loading(_that);case ReviewDetailsLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReviewDetailsLoading value)?  loading,TResult? Function( ReviewDetailsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case ReviewDetailsLoading() when loading != null:
return loading(_that);case ReviewDetailsLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<ReviewMediaModel> reviewMedia)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReviewDetailsLoading() when loading != null:
return loading();case ReviewDetailsLoaded() when loaded != null:
return loaded(_that.reviewMedia);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<ReviewMediaModel> reviewMedia)  loaded,}) {final _that = this;
switch (_that) {
case ReviewDetailsLoading():
return loading();case ReviewDetailsLoaded():
return loaded(_that.reviewMedia);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<ReviewMediaModel> reviewMedia)?  loaded,}) {final _that = this;
switch (_that) {
case ReviewDetailsLoading() when loading != null:
return loading();case ReviewDetailsLoaded() when loaded != null:
return loaded(_that.reviewMedia);case _:
  return null;

}
}

}

/// @nodoc


class ReviewDetailsLoading implements ReviewDetailsState {
  const ReviewDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewDetailsState.loading()';
}


}




/// @nodoc


class ReviewDetailsLoaded implements ReviewDetailsState {
  const ReviewDetailsLoaded({required final  List<ReviewMediaModel> reviewMedia}): _reviewMedia = reviewMedia;
  

 final  List<ReviewMediaModel> _reviewMedia;
 List<ReviewMediaModel> get reviewMedia {
  if (_reviewMedia is EqualUnmodifiableListView) return _reviewMedia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewMedia);
}


/// Create a copy of ReviewDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDetailsLoadedCopyWith<ReviewDetailsLoaded> get copyWith => _$ReviewDetailsLoadedCopyWithImpl<ReviewDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDetailsLoaded&&const DeepCollectionEquality().equals(other._reviewMedia, _reviewMedia));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviewMedia));

@override
String toString() {
  return 'ReviewDetailsState.loaded(reviewMedia: $reviewMedia)';
}


}

/// @nodoc
abstract mixin class $ReviewDetailsLoadedCopyWith<$Res> implements $ReviewDetailsStateCopyWith<$Res> {
  factory $ReviewDetailsLoadedCopyWith(ReviewDetailsLoaded value, $Res Function(ReviewDetailsLoaded) _then) = _$ReviewDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ReviewMediaModel> reviewMedia
});




}
/// @nodoc
class _$ReviewDetailsLoadedCopyWithImpl<$Res>
    implements $ReviewDetailsLoadedCopyWith<$Res> {
  _$ReviewDetailsLoadedCopyWithImpl(this._self, this._then);

  final ReviewDetailsLoaded _self;
  final $Res Function(ReviewDetailsLoaded) _then;

/// Create a copy of ReviewDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reviewMedia = null,}) {
  return _then(ReviewDetailsLoaded(
reviewMedia: null == reviewMedia ? _self._reviewMedia : reviewMedia // ignore: cast_nullable_to_non_nullable
as List<ReviewMediaModel>,
  ));
}


}

// dart format on
