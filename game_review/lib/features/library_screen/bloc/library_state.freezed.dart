// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState()';
}


}

/// @nodoc
class $LibraryStateCopyWith<$Res>  {
$LibraryStateCopyWith(LibraryState _, $Res Function(LibraryState) __);
}


/// Adds pattern-matching-related methods to [LibraryState].
extension LibraryStatePatterns on LibraryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LibraryInitial value)?  initial,TResult Function( LibraryLoading value)?  loading,TResult Function( LibrarySuccess value)?  success,TResult Function( LibraryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LibraryInitial() when initial != null:
return initial(_that);case LibraryLoading() when loading != null:
return loading(_that);case LibrarySuccess() when success != null:
return success(_that);case LibraryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LibraryInitial value)  initial,required TResult Function( LibraryLoading value)  loading,required TResult Function( LibrarySuccess value)  success,required TResult Function( LibraryError value)  error,}){
final _that = this;
switch (_that) {
case LibraryInitial():
return initial(_that);case LibraryLoading():
return loading(_that);case LibrarySuccess():
return success(_that);case LibraryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LibraryInitial value)?  initial,TResult? Function( LibraryLoading value)?  loading,TResult? Function( LibrarySuccess value)?  success,TResult? Function( LibraryError value)?  error,}){
final _that = this;
switch (_that) {
case LibraryInitial() when initial != null:
return initial(_that);case LibraryLoading() when loading != null:
return loading(_that);case LibrarySuccess() when success != null:
return success(_that);case LibraryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<GameModel> latestGames,  List<GameModel> popularGames,  List<GameModel> userLibraryGames,  List<GameModel> userWishlistGames,  UserModel? user)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LibraryInitial() when initial != null:
return initial();case LibraryLoading() when loading != null:
return loading();case LibrarySuccess() when success != null:
return success(_that.latestGames,_that.popularGames,_that.userLibraryGames,_that.userWishlistGames,_that.user);case LibraryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<GameModel> latestGames,  List<GameModel> popularGames,  List<GameModel> userLibraryGames,  List<GameModel> userWishlistGames,  UserModel? user)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LibraryInitial():
return initial();case LibraryLoading():
return loading();case LibrarySuccess():
return success(_that.latestGames,_that.popularGames,_that.userLibraryGames,_that.userWishlistGames,_that.user);case LibraryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<GameModel> latestGames,  List<GameModel> popularGames,  List<GameModel> userLibraryGames,  List<GameModel> userWishlistGames,  UserModel? user)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LibraryInitial() when initial != null:
return initial();case LibraryLoading() when loading != null:
return loading();case LibrarySuccess() when success != null:
return success(_that.latestGames,_that.popularGames,_that.userLibraryGames,_that.userWishlistGames,_that.user);case LibraryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LibraryInitial implements LibraryState {
  const LibraryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState.initial()';
}


}




/// @nodoc


class LibraryLoading implements LibraryState {
  const LibraryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState.loading()';
}


}




/// @nodoc


class LibrarySuccess implements LibraryState {
  const LibrarySuccess({required final  List<GameModel> latestGames, required final  List<GameModel> popularGames, final  List<GameModel> userLibraryGames = const [], final  List<GameModel> userWishlistGames = const [], this.user = null}): _latestGames = latestGames,_popularGames = popularGames,_userLibraryGames = userLibraryGames,_userWishlistGames = userWishlistGames;
  

 final  List<GameModel> _latestGames;
 List<GameModel> get latestGames {
  if (_latestGames is EqualUnmodifiableListView) return _latestGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestGames);
}

 final  List<GameModel> _popularGames;
 List<GameModel> get popularGames {
  if (_popularGames is EqualUnmodifiableListView) return _popularGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularGames);
}

 final  List<GameModel> _userLibraryGames;
@JsonKey() List<GameModel> get userLibraryGames {
  if (_userLibraryGames is EqualUnmodifiableListView) return _userLibraryGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userLibraryGames);
}

 final  List<GameModel> _userWishlistGames;
@JsonKey() List<GameModel> get userWishlistGames {
  if (_userWishlistGames is EqualUnmodifiableListView) return _userWishlistGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userWishlistGames);
}

@JsonKey() final  UserModel? user;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibrarySuccessCopyWith<LibrarySuccess> get copyWith => _$LibrarySuccessCopyWithImpl<LibrarySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibrarySuccess&&const DeepCollectionEquality().equals(other._latestGames, _latestGames)&&const DeepCollectionEquality().equals(other._popularGames, _popularGames)&&const DeepCollectionEquality().equals(other._userLibraryGames, _userLibraryGames)&&const DeepCollectionEquality().equals(other._userWishlistGames, _userWishlistGames)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_latestGames),const DeepCollectionEquality().hash(_popularGames),const DeepCollectionEquality().hash(_userLibraryGames),const DeepCollectionEquality().hash(_userWishlistGames),user);

@override
String toString() {
  return 'LibraryState.success(latestGames: $latestGames, popularGames: $popularGames, userLibraryGames: $userLibraryGames, userWishlistGames: $userWishlistGames, user: $user)';
}


}

/// @nodoc
abstract mixin class $LibrarySuccessCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory $LibrarySuccessCopyWith(LibrarySuccess value, $Res Function(LibrarySuccess) _then) = _$LibrarySuccessCopyWithImpl;
@useResult
$Res call({
 List<GameModel> latestGames, List<GameModel> popularGames, List<GameModel> userLibraryGames, List<GameModel> userWishlistGames, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$LibrarySuccessCopyWithImpl<$Res>
    implements $LibrarySuccessCopyWith<$Res> {
  _$LibrarySuccessCopyWithImpl(this._self, this._then);

  final LibrarySuccess _self;
  final $Res Function(LibrarySuccess) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? latestGames = null,Object? popularGames = null,Object? userLibraryGames = null,Object? userWishlistGames = null,Object? user = freezed,}) {
  return _then(LibrarySuccess(
latestGames: null == latestGames ? _self._latestGames : latestGames // ignore: cast_nullable_to_non_nullable
as List<GameModel>,popularGames: null == popularGames ? _self._popularGames : popularGames // ignore: cast_nullable_to_non_nullable
as List<GameModel>,userLibraryGames: null == userLibraryGames ? _self._userLibraryGames : userLibraryGames // ignore: cast_nullable_to_non_nullable
as List<GameModel>,userWishlistGames: null == userWishlistGames ? _self._userWishlistGames : userWishlistGames // ignore: cast_nullable_to_non_nullable
as List<GameModel>,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class LibraryError implements LibraryState {
  const LibraryError(this.message);
  

 final  String message;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryErrorCopyWith<LibraryError> get copyWith => _$LibraryErrorCopyWithImpl<LibraryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LibraryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LibraryErrorCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory $LibraryErrorCopyWith(LibraryError value, $Res Function(LibraryError) _then) = _$LibraryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LibraryErrorCopyWithImpl<$Res>
    implements $LibraryErrorCopyWith<$Res> {
  _$LibraryErrorCopyWithImpl(this._self, this._then);

  final LibraryError _self;
  final $Res Function(LibraryError) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LibraryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
