// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState()';
}


}

/// @nodoc
class $UserProfileStateCopyWith<$Res>  {
$UserProfileStateCopyWith(UserProfileState _, $Res Function(UserProfileState) __);
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UserProfileLoading value)?  loading,TResult Function( _UserProfileLoaded value)?  loaded,TResult Function( _UserProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileLoading() when loading != null:
return loading(_that);case _UserProfileLoaded() when loaded != null:
return loaded(_that);case _UserProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UserProfileLoading value)  loading,required TResult Function( _UserProfileLoaded value)  loaded,required TResult Function( _UserProfileError value)  error,}){
final _that = this;
switch (_that) {
case _UserProfileLoading():
return loading(_that);case _UserProfileLoaded():
return loaded(_that);case _UserProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UserProfileLoading value)?  loading,TResult? Function( _UserProfileLoaded value)?  loaded,TResult? Function( _UserProfileError value)?  error,}){
final _that = this;
switch (_that) {
case _UserProfileLoading() when loading != null:
return loading(_that);case _UserProfileLoaded() when loaded != null:
return loaded(_that);case _UserProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( User user,  String? loggedUserId,  bool? alreadyFriends,  String? message)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileLoading() when loading != null:
return loading();case _UserProfileLoaded() when loaded != null:
return loaded(_that.user,_that.loggedUserId,_that.alreadyFriends,_that.message);case _UserProfileError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( User user,  String? loggedUserId,  bool? alreadyFriends,  String? message)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _UserProfileLoading():
return loading();case _UserProfileLoaded():
return loaded(_that.user,_that.loggedUserId,_that.alreadyFriends,_that.message);case _UserProfileError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( User user,  String? loggedUserId,  bool? alreadyFriends,  String? message)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _UserProfileLoading() when loading != null:
return loading();case _UserProfileLoaded() when loaded != null:
return loaded(_that.user,_that.loggedUserId,_that.alreadyFriends,_that.message);case _UserProfileError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileLoading implements UserProfileState {
  const _UserProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.loading()';
}


}




/// @nodoc


class _UserProfileLoaded implements UserProfileState {
  const _UserProfileLoaded({required this.user, required this.loggedUserId, required this.alreadyFriends, required this.message});
  

 final  User user;
 final  String? loggedUserId;
 final  bool? alreadyFriends;
 final  String? message;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileLoadedCopyWith<_UserProfileLoaded> get copyWith => __$UserProfileLoadedCopyWithImpl<_UserProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileLoaded&&(identical(other.user, user) || other.user == user)&&(identical(other.loggedUserId, loggedUserId) || other.loggedUserId == loggedUserId)&&(identical(other.alreadyFriends, alreadyFriends) || other.alreadyFriends == alreadyFriends)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,user,loggedUserId,alreadyFriends,message);

@override
String toString() {
  return 'UserProfileState.loaded(user: $user, loggedUserId: $loggedUserId, alreadyFriends: $alreadyFriends, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UserProfileLoadedCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileLoadedCopyWith(_UserProfileLoaded value, $Res Function(_UserProfileLoaded) _then) = __$UserProfileLoadedCopyWithImpl;
@useResult
$Res call({
 User user, String? loggedUserId, bool? alreadyFriends, String? message
});




}
/// @nodoc
class __$UserProfileLoadedCopyWithImpl<$Res>
    implements _$UserProfileLoadedCopyWith<$Res> {
  __$UserProfileLoadedCopyWithImpl(this._self, this._then);

  final _UserProfileLoaded _self;
  final $Res Function(_UserProfileLoaded) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? loggedUserId = freezed,Object? alreadyFriends = freezed,Object? message = freezed,}) {
  return _then(_UserProfileLoaded(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,loggedUserId: freezed == loggedUserId ? _self.loggedUserId : loggedUserId // ignore: cast_nullable_to_non_nullable
as String?,alreadyFriends: freezed == alreadyFriends ? _self.alreadyFriends : alreadyFriends // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UserProfileError implements UserProfileState {
  const _UserProfileError({required this.message});
  

 final  String message;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileErrorCopyWith<_UserProfileError> get copyWith => __$UserProfileErrorCopyWithImpl<_UserProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UserProfileErrorCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileErrorCopyWith(_UserProfileError value, $Res Function(_UserProfileError) _then) = __$UserProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UserProfileErrorCopyWithImpl<$Res>
    implements _$UserProfileErrorCopyWith<$Res> {
  __$UserProfileErrorCopyWithImpl(this._self, this._then);

  final _UserProfileError _self;
  final $Res Function(_UserProfileError) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UserProfileError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
