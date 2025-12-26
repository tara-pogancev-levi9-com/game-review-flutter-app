// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewCommentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewCommentsState()';
}


}

/// @nodoc
class $ReviewCommentsStateCopyWith<$Res>  {
$ReviewCommentsStateCopyWith(ReviewCommentsState _, $Res Function(ReviewCommentsState) __);
}


/// Adds pattern-matching-related methods to [ReviewCommentsState].
extension ReviewCommentsStatePatterns on ReviewCommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReviewCommentsInitial value)?  initial,TResult Function( ReviewCommentsLoading value)?  loading,TResult Function( ReviewCommentsSuccess value)?  success,TResult Function( ReviewCommentsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReviewCommentsInitial() when initial != null:
return initial(_that);case ReviewCommentsLoading() when loading != null:
return loading(_that);case ReviewCommentsSuccess() when success != null:
return success(_that);case ReviewCommentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReviewCommentsInitial value)  initial,required TResult Function( ReviewCommentsLoading value)  loading,required TResult Function( ReviewCommentsSuccess value)  success,required TResult Function( ReviewCommentsError value)  error,}){
final _that = this;
switch (_that) {
case ReviewCommentsInitial():
return initial(_that);case ReviewCommentsLoading():
return loading(_that);case ReviewCommentsSuccess():
return success(_that);case ReviewCommentsError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReviewCommentsInitial value)?  initial,TResult? Function( ReviewCommentsLoading value)?  loading,TResult? Function( ReviewCommentsSuccess value)?  success,TResult? Function( ReviewCommentsError value)?  error,}){
final _that = this;
switch (_that) {
case ReviewCommentsInitial() when initial != null:
return initial(_that);case ReviewCommentsLoading() when loading != null:
return loading(_that);case ReviewCommentsSuccess() when success != null:
return success(_that);case ReviewCommentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ReviewCommentModel> comments)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReviewCommentsInitial() when initial != null:
return initial();case ReviewCommentsLoading() when loading != null:
return loading();case ReviewCommentsSuccess() when success != null:
return success(_that.comments);case ReviewCommentsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ReviewCommentModel> comments)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ReviewCommentsInitial():
return initial();case ReviewCommentsLoading():
return loading();case ReviewCommentsSuccess():
return success(_that.comments);case ReviewCommentsError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ReviewCommentModel> comments)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ReviewCommentsInitial() when initial != null:
return initial();case ReviewCommentsLoading() when loading != null:
return loading();case ReviewCommentsSuccess() when success != null:
return success(_that.comments);case ReviewCommentsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ReviewCommentsInitial implements ReviewCommentsState {
  const ReviewCommentsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewCommentsState.initial()';
}


}




/// @nodoc


class ReviewCommentsLoading implements ReviewCommentsState {
  const ReviewCommentsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewCommentsState.loading()';
}


}




/// @nodoc


class ReviewCommentsSuccess implements ReviewCommentsState {
  const ReviewCommentsSuccess(final  List<ReviewCommentModel> comments): _comments = comments;
  

 final  List<ReviewCommentModel> _comments;
 List<ReviewCommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of ReviewCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCommentsSuccessCopyWith<ReviewCommentsSuccess> get copyWith => _$ReviewCommentsSuccessCopyWithImpl<ReviewCommentsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentsSuccess&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'ReviewCommentsState.success(comments: $comments)';
}


}

/// @nodoc
abstract mixin class $ReviewCommentsSuccessCopyWith<$Res> implements $ReviewCommentsStateCopyWith<$Res> {
  factory $ReviewCommentsSuccessCopyWith(ReviewCommentsSuccess value, $Res Function(ReviewCommentsSuccess) _then) = _$ReviewCommentsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ReviewCommentModel> comments
});




}
/// @nodoc
class _$ReviewCommentsSuccessCopyWithImpl<$Res>
    implements $ReviewCommentsSuccessCopyWith<$Res> {
  _$ReviewCommentsSuccessCopyWithImpl(this._self, this._then);

  final ReviewCommentsSuccess _self;
  final $Res Function(ReviewCommentsSuccess) _then;

/// Create a copy of ReviewCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(ReviewCommentsSuccess(
null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<ReviewCommentModel>,
  ));
}


}

/// @nodoc


class ReviewCommentsError implements ReviewCommentsState {
  const ReviewCommentsError(this.message);
  

 final  String message;

/// Create a copy of ReviewCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCommentsErrorCopyWith<ReviewCommentsError> get copyWith => _$ReviewCommentsErrorCopyWithImpl<ReviewCommentsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCommentsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ReviewCommentsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReviewCommentsErrorCopyWith<$Res> implements $ReviewCommentsStateCopyWith<$Res> {
  factory $ReviewCommentsErrorCopyWith(ReviewCommentsError value, $Res Function(ReviewCommentsError) _then) = _$ReviewCommentsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReviewCommentsErrorCopyWithImpl<$Res>
    implements $ReviewCommentsErrorCopyWith<$Res> {
  _$ReviewCommentsErrorCopyWithImpl(this._self, this._then);

  final ReviewCommentsError _self;
  final $Res Function(ReviewCommentsError) _then;

/// Create a copy of ReviewCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReviewCommentsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
