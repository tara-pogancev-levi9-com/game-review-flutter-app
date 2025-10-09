// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReviewCommentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReviewComment> comments) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReviewComment> comments)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReviewComment> comments)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewCommentsInitial value) initial,
    required TResult Function(ReviewCommentsLoading value) loading,
    required TResult Function(ReviewCommentsSuccess value) success,
    required TResult Function(ReviewCommentsError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewCommentsInitial value)? initial,
    TResult? Function(ReviewCommentsLoading value)? loading,
    TResult? Function(ReviewCommentsSuccess value)? success,
    TResult? Function(ReviewCommentsError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewCommentsInitial value)? initial,
    TResult Function(ReviewCommentsLoading value)? loading,
    TResult Function(ReviewCommentsSuccess value)? success,
    TResult Function(ReviewCommentsError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCommentsStateCopyWith<$Res> {
  factory $ReviewCommentsStateCopyWith(
    ReviewCommentsState value,
    $Res Function(ReviewCommentsState) then,
  ) = _$ReviewCommentsStateCopyWithImpl<$Res, ReviewCommentsState>;
}

/// @nodoc
class _$ReviewCommentsStateCopyWithImpl<$Res, $Val extends ReviewCommentsState>
    implements $ReviewCommentsStateCopyWith<$Res> {
  _$ReviewCommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ReviewCommentsInitialImplCopyWith<$Res> {
  factory _$$ReviewCommentsInitialImplCopyWith(
    _$ReviewCommentsInitialImpl value,
    $Res Function(_$ReviewCommentsInitialImpl) then,
  ) = __$$ReviewCommentsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReviewCommentsInitialImplCopyWithImpl<$Res>
    extends _$ReviewCommentsStateCopyWithImpl<$Res, _$ReviewCommentsInitialImpl>
    implements _$$ReviewCommentsInitialImplCopyWith<$Res> {
  __$$ReviewCommentsInitialImplCopyWithImpl(
    _$ReviewCommentsInitialImpl _value,
    $Res Function(_$ReviewCommentsInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReviewCommentsInitialImpl implements ReviewCommentsInitial {
  const _$ReviewCommentsInitialImpl();

  @override
  String toString() {
    return 'ReviewCommentsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCommentsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReviewComment> comments) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReviewComment> comments)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReviewComment> comments)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewCommentsInitial value) initial,
    required TResult Function(ReviewCommentsLoading value) loading,
    required TResult Function(ReviewCommentsSuccess value) success,
    required TResult Function(ReviewCommentsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewCommentsInitial value)? initial,
    TResult? Function(ReviewCommentsLoading value)? loading,
    TResult? Function(ReviewCommentsSuccess value)? success,
    TResult? Function(ReviewCommentsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewCommentsInitial value)? initial,
    TResult Function(ReviewCommentsLoading value)? loading,
    TResult Function(ReviewCommentsSuccess value)? success,
    TResult Function(ReviewCommentsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReviewCommentsInitial implements ReviewCommentsState {
  const factory ReviewCommentsInitial() = _$ReviewCommentsInitialImpl;
}

/// @nodoc
abstract class _$$ReviewCommentsLoadingImplCopyWith<$Res> {
  factory _$$ReviewCommentsLoadingImplCopyWith(
    _$ReviewCommentsLoadingImpl value,
    $Res Function(_$ReviewCommentsLoadingImpl) then,
  ) = __$$ReviewCommentsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReviewCommentsLoadingImplCopyWithImpl<$Res>
    extends _$ReviewCommentsStateCopyWithImpl<$Res, _$ReviewCommentsLoadingImpl>
    implements _$$ReviewCommentsLoadingImplCopyWith<$Res> {
  __$$ReviewCommentsLoadingImplCopyWithImpl(
    _$ReviewCommentsLoadingImpl _value,
    $Res Function(_$ReviewCommentsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReviewCommentsLoadingImpl implements ReviewCommentsLoading {
  const _$ReviewCommentsLoadingImpl();

  @override
  String toString() {
    return 'ReviewCommentsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCommentsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReviewComment> comments) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReviewComment> comments)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReviewComment> comments)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewCommentsInitial value) initial,
    required TResult Function(ReviewCommentsLoading value) loading,
    required TResult Function(ReviewCommentsSuccess value) success,
    required TResult Function(ReviewCommentsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewCommentsInitial value)? initial,
    TResult? Function(ReviewCommentsLoading value)? loading,
    TResult? Function(ReviewCommentsSuccess value)? success,
    TResult? Function(ReviewCommentsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewCommentsInitial value)? initial,
    TResult Function(ReviewCommentsLoading value)? loading,
    TResult Function(ReviewCommentsSuccess value)? success,
    TResult Function(ReviewCommentsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReviewCommentsLoading implements ReviewCommentsState {
  const factory ReviewCommentsLoading() = _$ReviewCommentsLoadingImpl;
}

/// @nodoc
abstract class _$$ReviewCommentsSuccessImplCopyWith<$Res> {
  factory _$$ReviewCommentsSuccessImplCopyWith(
    _$ReviewCommentsSuccessImpl value,
    $Res Function(_$ReviewCommentsSuccessImpl) then,
  ) = __$$ReviewCommentsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReviewComment> comments});
}

/// @nodoc
class __$$ReviewCommentsSuccessImplCopyWithImpl<$Res>
    extends _$ReviewCommentsStateCopyWithImpl<$Res, _$ReviewCommentsSuccessImpl>
    implements _$$ReviewCommentsSuccessImplCopyWith<$Res> {
  __$$ReviewCommentsSuccessImplCopyWithImpl(
    _$ReviewCommentsSuccessImpl _value,
    $Res Function(_$ReviewCommentsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? comments = null}) {
    return _then(
      _$ReviewCommentsSuccessImpl(
        null == comments
            ? _value._comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as List<ReviewComment>,
      ),
    );
  }
}

/// @nodoc

class _$ReviewCommentsSuccessImpl implements ReviewCommentsSuccess {
  const _$ReviewCommentsSuccessImpl(final List<ReviewComment> comments)
    : _comments = comments;

  final List<ReviewComment> _comments;
  @override
  List<ReviewComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'ReviewCommentsState.success(comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCommentsSuccessImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCommentsSuccessImplCopyWith<_$ReviewCommentsSuccessImpl>
  get copyWith =>
      __$$ReviewCommentsSuccessImplCopyWithImpl<_$ReviewCommentsSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReviewComment> comments) success,
    required TResult Function(String message) error,
  }) {
    return success(comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReviewComment> comments)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReviewComment> comments)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewCommentsInitial value) initial,
    required TResult Function(ReviewCommentsLoading value) loading,
    required TResult Function(ReviewCommentsSuccess value) success,
    required TResult Function(ReviewCommentsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewCommentsInitial value)? initial,
    TResult? Function(ReviewCommentsLoading value)? loading,
    TResult? Function(ReviewCommentsSuccess value)? success,
    TResult? Function(ReviewCommentsError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewCommentsInitial value)? initial,
    TResult Function(ReviewCommentsLoading value)? loading,
    TResult Function(ReviewCommentsSuccess value)? success,
    TResult Function(ReviewCommentsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ReviewCommentsSuccess implements ReviewCommentsState {
  const factory ReviewCommentsSuccess(final List<ReviewComment> comments) =
      _$ReviewCommentsSuccessImpl;

  List<ReviewComment> get comments;

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCommentsSuccessImplCopyWith<_$ReviewCommentsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewCommentsErrorImplCopyWith<$Res> {
  factory _$$ReviewCommentsErrorImplCopyWith(
    _$ReviewCommentsErrorImpl value,
    $Res Function(_$ReviewCommentsErrorImpl) then,
  ) = __$$ReviewCommentsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ReviewCommentsErrorImplCopyWithImpl<$Res>
    extends _$ReviewCommentsStateCopyWithImpl<$Res, _$ReviewCommentsErrorImpl>
    implements _$$ReviewCommentsErrorImplCopyWith<$Res> {
  __$$ReviewCommentsErrorImplCopyWithImpl(
    _$ReviewCommentsErrorImpl _value,
    $Res Function(_$ReviewCommentsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ReviewCommentsErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ReviewCommentsErrorImpl implements ReviewCommentsError {
  const _$ReviewCommentsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReviewCommentsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCommentsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCommentsErrorImplCopyWith<_$ReviewCommentsErrorImpl> get copyWith =>
      __$$ReviewCommentsErrorImplCopyWithImpl<_$ReviewCommentsErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReviewComment> comments) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReviewComment> comments)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReviewComment> comments)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewCommentsInitial value) initial,
    required TResult Function(ReviewCommentsLoading value) loading,
    required TResult Function(ReviewCommentsSuccess value) success,
    required TResult Function(ReviewCommentsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewCommentsInitial value)? initial,
    TResult? Function(ReviewCommentsLoading value)? loading,
    TResult? Function(ReviewCommentsSuccess value)? success,
    TResult? Function(ReviewCommentsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewCommentsInitial value)? initial,
    TResult Function(ReviewCommentsLoading value)? loading,
    TResult Function(ReviewCommentsSuccess value)? success,
    TResult Function(ReviewCommentsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReviewCommentsError implements ReviewCommentsState {
  const factory ReviewCommentsError(final String message) =
      _$ReviewCommentsErrorImpl;

  String get message;

  /// Create a copy of ReviewCommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCommentsErrorImplCopyWith<_$ReviewCommentsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
