// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LibraryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )
    success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibrarySuccess value) success,
    required TResult Function(LibraryError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibrarySuccess value)? success,
    TResult? Function(LibraryError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibrarySuccess value)? success,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
    LibraryState value,
    $Res Function(LibraryState) then,
  ) = _$LibraryStateCopyWithImpl<$Res, LibraryState>;
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LibraryInitialImplCopyWith<$Res> {
  factory _$$LibraryInitialImplCopyWith(
    _$LibraryInitialImpl value,
    $Res Function(_$LibraryInitialImpl) then,
  ) = __$$LibraryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibraryInitialImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryInitialImpl>
    implements _$$LibraryInitialImplCopyWith<$Res> {
  __$$LibraryInitialImplCopyWithImpl(
    _$LibraryInitialImpl _value,
    $Res Function(_$LibraryInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LibraryInitialImpl implements LibraryInitial {
  const _$LibraryInitialImpl();

  @override
  String toString() {
    return 'LibraryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LibraryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
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
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibrarySuccess value) success,
    required TResult Function(LibraryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibrarySuccess value)? success,
    TResult? Function(LibraryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibrarySuccess value)? success,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LibraryInitial implements LibraryState {
  const factory LibraryInitial() = _$LibraryInitialImpl;
}

/// @nodoc
abstract class _$$LibraryLoadingImplCopyWith<$Res> {
  factory _$$LibraryLoadingImplCopyWith(
    _$LibraryLoadingImpl value,
    $Res Function(_$LibraryLoadingImpl) then,
  ) = __$$LibraryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibraryLoadingImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryLoadingImpl>
    implements _$$LibraryLoadingImplCopyWith<$Res> {
  __$$LibraryLoadingImplCopyWithImpl(
    _$LibraryLoadingImpl _value,
    $Res Function(_$LibraryLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LibraryLoadingImpl implements LibraryLoading {
  const _$LibraryLoadingImpl();

  @override
  String toString() {
    return 'LibraryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LibraryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
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
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibrarySuccess value) success,
    required TResult Function(LibraryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibrarySuccess value)? success,
    TResult? Function(LibraryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibrarySuccess value)? success,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LibraryLoading implements LibraryState {
  const factory LibraryLoading() = _$LibraryLoadingImpl;
}

/// @nodoc
abstract class _$$LibrarySuccessImplCopyWith<$Res> {
  factory _$$LibrarySuccessImplCopyWith(
    _$LibrarySuccessImpl value,
    $Res Function(_$LibrarySuccessImpl) then,
  ) = __$$LibrarySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<Game> latestGames,
    List<Game> popularGames,
    List<Game> userLibraryGames,
    List<Game> userWishlistGames,
  });
}

/// @nodoc
class __$$LibrarySuccessImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibrarySuccessImpl>
    implements _$$LibrarySuccessImplCopyWith<$Res> {
  __$$LibrarySuccessImplCopyWithImpl(
    _$LibrarySuccessImpl _value,
    $Res Function(_$LibrarySuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestGames = null,
    Object? popularGames = null,
    Object? userLibraryGames = null,
    Object? userWishlistGames = null,
  }) {
    return _then(
      _$LibrarySuccessImpl(
        latestGames: null == latestGames
            ? _value._latestGames
            : latestGames // ignore: cast_nullable_to_non_nullable
                  as List<Game>,
        popularGames: null == popularGames
            ? _value._popularGames
            : popularGames // ignore: cast_nullable_to_non_nullable
                  as List<Game>,
        userLibraryGames: null == userLibraryGames
            ? _value._userLibraryGames
            : userLibraryGames // ignore: cast_nullable_to_non_nullable
                  as List<Game>,
        userWishlistGames: null == userWishlistGames
            ? _value._userWishlistGames
            : userWishlistGames // ignore: cast_nullable_to_non_nullable
                  as List<Game>,
      ),
    );
  }
}

/// @nodoc

class _$LibrarySuccessImpl implements LibrarySuccess {
  const _$LibrarySuccessImpl({
    required final List<Game> latestGames,
    required final List<Game> popularGames,
    final List<Game> userLibraryGames = const [],
    final List<Game> userWishlistGames = const [],
  }) : _latestGames = latestGames,
       _popularGames = popularGames,
       _userLibraryGames = userLibraryGames,
       _userWishlistGames = userWishlistGames;

  final List<Game> _latestGames;
  @override
  List<Game> get latestGames {
    if (_latestGames is EqualUnmodifiableListView) return _latestGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestGames);
  }

  final List<Game> _popularGames;
  @override
  List<Game> get popularGames {
    if (_popularGames is EqualUnmodifiableListView) return _popularGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularGames);
  }

  final List<Game> _userLibraryGames;
  @override
  @JsonKey()
  List<Game> get userLibraryGames {
    if (_userLibraryGames is EqualUnmodifiableListView)
      return _userLibraryGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userLibraryGames);
  }

  final List<Game> _userWishlistGames;
  @override
  @JsonKey()
  List<Game> get userWishlistGames {
    if (_userWishlistGames is EqualUnmodifiableListView)
      return _userWishlistGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userWishlistGames);
  }

  @override
  String toString() {
    return 'LibraryState.success(latestGames: $latestGames, popularGames: $popularGames, userLibraryGames: $userLibraryGames, userWishlistGames: $userWishlistGames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrarySuccessImpl &&
            const DeepCollectionEquality().equals(
              other._latestGames,
              _latestGames,
            ) &&
            const DeepCollectionEquality().equals(
              other._popularGames,
              _popularGames,
            ) &&
            const DeepCollectionEquality().equals(
              other._userLibraryGames,
              _userLibraryGames,
            ) &&
            const DeepCollectionEquality().equals(
              other._userWishlistGames,
              _userWishlistGames,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_latestGames),
    const DeepCollectionEquality().hash(_popularGames),
    const DeepCollectionEquality().hash(_userLibraryGames),
    const DeepCollectionEquality().hash(_userWishlistGames),
  );

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrarySuccessImplCopyWith<_$LibrarySuccessImpl> get copyWith =>
      __$$LibrarySuccessImplCopyWithImpl<_$LibrarySuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return success(
      latestGames,
      popularGames,
      userLibraryGames,
      userWishlistGames,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(
      latestGames,
      popularGames,
      userLibraryGames,
      userWishlistGames,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
        latestGames,
        popularGames,
        userLibraryGames,
        userWishlistGames,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibrarySuccess value) success,
    required TResult Function(LibraryError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibrarySuccess value)? success,
    TResult? Function(LibraryError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibrarySuccess value)? success,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LibrarySuccess implements LibraryState {
  const factory LibrarySuccess({
    required final List<Game> latestGames,
    required final List<Game> popularGames,
    final List<Game> userLibraryGames,
    final List<Game> userWishlistGames,
  }) = _$LibrarySuccessImpl;

  List<Game> get latestGames;
  List<Game> get popularGames;
  List<Game> get userLibraryGames;
  List<Game> get userWishlistGames;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibrarySuccessImplCopyWith<_$LibrarySuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibraryErrorImplCopyWith<$Res> {
  factory _$$LibraryErrorImplCopyWith(
    _$LibraryErrorImpl value,
    $Res Function(_$LibraryErrorImpl) then,
  ) = __$$LibraryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LibraryErrorImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryErrorImpl>
    implements _$$LibraryErrorImplCopyWith<$Res> {
  __$$LibraryErrorImplCopyWithImpl(
    _$LibraryErrorImpl _value,
    $Res Function(_$LibraryErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$LibraryErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LibraryErrorImpl implements LibraryError {
  const _$LibraryErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LibraryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryErrorImplCopyWith<_$LibraryErrorImpl> get copyWith =>
      __$$LibraryErrorImplCopyWithImpl<_$LibraryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )
    success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Game> latestGames,
      List<Game> popularGames,
      List<Game> userLibraryGames,
      List<Game> userWishlistGames,
    )?
    success,
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
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibrarySuccess value) success,
    required TResult Function(LibraryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibrarySuccess value)? success,
    TResult? Function(LibraryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibrarySuccess value)? success,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LibraryError implements LibraryState {
  const factory LibraryError(final String message) = _$LibraryErrorImpl;

  String get message;

  /// Create a copy of LibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryErrorImplCopyWith<_$LibraryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
