// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'game_id')
  String? get gameId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_rating')
  double? get overallRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'gameplay_rating')
  double? get gameplayRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'graphics_rating')
  double? get graphicsRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'story_rating')
  double? get storyRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'sound_rating')
  double? get soundRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_rating')
  double? get valueRating => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _listOrStringToString)
  String? get pros => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _listOrStringToString)
  String? get cons => throw _privateConstructorUsedError;
  @JsonKey(name: 'playtime_hours')
  int? get playtimeHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_status')
  String? get completionStatus => throw _privateConstructorUsedError;
  bool? get recommended => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Game? get game => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'game_id') String? gameId,
    String? title,
    String? content,
    @JsonKey(name: 'overall_rating') double? overallRating,
    @JsonKey(name: 'gameplay_rating') double? gameplayRating,
    @JsonKey(name: 'graphics_rating') double? graphicsRating,
    @JsonKey(name: 'story_rating') double? storyRating,
    @JsonKey(name: 'sound_rating') double? soundRating,
    @JsonKey(name: 'value_rating') double? valueRating,
    @JsonKey(fromJson: _listOrStringToString) String? pros,
    @JsonKey(fromJson: _listOrStringToString) String? cons,
    @JsonKey(name: 'playtime_hours') int? playtimeHours,
    @JsonKey(name: 'completion_status') String? completionStatus,
    bool? recommended,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(ignore: true) Game? game,
  });

  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? gameId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? overallRating = freezed,
    Object? gameplayRating = freezed,
    Object? graphicsRating = freezed,
    Object? storyRating = freezed,
    Object? soundRating = freezed,
    Object? valueRating = freezed,
    Object? pros = freezed,
    Object? cons = freezed,
    Object? playtimeHours = freezed,
    Object? completionStatus = freezed,
    Object? recommended = freezed,
    Object? createdAt = freezed,
    Object? game = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            gameId: freezed == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            overallRating: freezed == overallRating
                ? _value.overallRating
                : overallRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            gameplayRating: freezed == gameplayRating
                ? _value.gameplayRating
                : gameplayRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            graphicsRating: freezed == graphicsRating
                ? _value.graphicsRating
                : graphicsRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            storyRating: freezed == storyRating
                ? _value.storyRating
                : storyRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            soundRating: freezed == soundRating
                ? _value.soundRating
                : soundRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            valueRating: freezed == valueRating
                ? _value.valueRating
                : valueRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            pros: freezed == pros
                ? _value.pros
                : pros // ignore: cast_nullable_to_non_nullable
                      as String?,
            cons: freezed == cons
                ? _value.cons
                : cons // ignore: cast_nullable_to_non_nullable
                      as String?,
            playtimeHours: freezed == playtimeHours
                ? _value.playtimeHours
                : playtimeHours // ignore: cast_nullable_to_non_nullable
                      as int?,
            completionStatus: freezed == completionStatus
                ? _value.completionStatus
                : completionStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            recommended: freezed == recommended
                ? _value.recommended
                : recommended // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            game: freezed == game
                ? _value.game
                : game // ignore: cast_nullable_to_non_nullable
                      as Game?,
          )
          as $Val,
    );
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameCopyWith<$Res>? get game {
    if (_value.game == null) {
      return null;
    }

    return $GameCopyWith<$Res>(_value.game!, (value) {
      return _then(_value.copyWith(game: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
    _$ReviewImpl value,
    $Res Function(_$ReviewImpl) then,
  ) = __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'game_id') String? gameId,
    String? title,
    String? content,
    @JsonKey(name: 'overall_rating') double? overallRating,
    @JsonKey(name: 'gameplay_rating') double? gameplayRating,
    @JsonKey(name: 'graphics_rating') double? graphicsRating,
    @JsonKey(name: 'story_rating') double? storyRating,
    @JsonKey(name: 'sound_rating') double? soundRating,
    @JsonKey(name: 'value_rating') double? valueRating,
    @JsonKey(fromJson: _listOrStringToString) String? pros,
    @JsonKey(fromJson: _listOrStringToString) String? cons,
    @JsonKey(name: 'playtime_hours') int? playtimeHours,
    @JsonKey(name: 'completion_status') String? completionStatus,
    bool? recommended,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(ignore: true) Game? game,
  });

  @override
  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
    _$ReviewImpl _value,
    $Res Function(_$ReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? gameId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? overallRating = freezed,
    Object? gameplayRating = freezed,
    Object? graphicsRating = freezed,
    Object? storyRating = freezed,
    Object? soundRating = freezed,
    Object? valueRating = freezed,
    Object? pros = freezed,
    Object? cons = freezed,
    Object? playtimeHours = freezed,
    Object? completionStatus = freezed,
    Object? recommended = freezed,
    Object? createdAt = freezed,
    Object? game = freezed,
  }) {
    return _then(
      _$ReviewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        gameId: freezed == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        overallRating: freezed == overallRating
            ? _value.overallRating
            : overallRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        gameplayRating: freezed == gameplayRating
            ? _value.gameplayRating
            : gameplayRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        graphicsRating: freezed == graphicsRating
            ? _value.graphicsRating
            : graphicsRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        storyRating: freezed == storyRating
            ? _value.storyRating
            : storyRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        soundRating: freezed == soundRating
            ? _value.soundRating
            : soundRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        valueRating: freezed == valueRating
            ? _value.valueRating
            : valueRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        pros: freezed == pros
            ? _value.pros
            : pros // ignore: cast_nullable_to_non_nullable
                  as String?,
        cons: freezed == cons
            ? _value.cons
            : cons // ignore: cast_nullable_to_non_nullable
                  as String?,
        playtimeHours: freezed == playtimeHours
            ? _value.playtimeHours
            : playtimeHours // ignore: cast_nullable_to_non_nullable
                  as int?,
        completionStatus: freezed == completionStatus
            ? _value.completionStatus
            : completionStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        recommended: freezed == recommended
            ? _value.recommended
            : recommended // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        game: freezed == game
            ? _value.game
            : game // ignore: cast_nullable_to_non_nullable
                  as Game?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl({
    required this.id,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'game_id') this.gameId,
    this.title,
    this.content,
    @JsonKey(name: 'overall_rating') this.overallRating,
    @JsonKey(name: 'gameplay_rating') this.gameplayRating,
    @JsonKey(name: 'graphics_rating') this.graphicsRating,
    @JsonKey(name: 'story_rating') this.storyRating,
    @JsonKey(name: 'sound_rating') this.soundRating,
    @JsonKey(name: 'value_rating') this.valueRating,
    @JsonKey(fromJson: _listOrStringToString) this.pros,
    @JsonKey(fromJson: _listOrStringToString) this.cons,
    @JsonKey(name: 'playtime_hours') this.playtimeHours,
    @JsonKey(name: 'completion_status') this.completionStatus,
    this.recommended,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(ignore: true) this.game,
  });

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'game_id')
  final String? gameId;
  @override
  final String? title;
  @override
  final String? content;
  @override
  @JsonKey(name: 'overall_rating')
  final double? overallRating;
  @override
  @JsonKey(name: 'gameplay_rating')
  final double? gameplayRating;
  @override
  @JsonKey(name: 'graphics_rating')
  final double? graphicsRating;
  @override
  @JsonKey(name: 'story_rating')
  final double? storyRating;
  @override
  @JsonKey(name: 'sound_rating')
  final double? soundRating;
  @override
  @JsonKey(name: 'value_rating')
  final double? valueRating;
  @override
  @JsonKey(fromJson: _listOrStringToString)
  final String? pros;
  @override
  @JsonKey(fromJson: _listOrStringToString)
  final String? cons;
  @override
  @JsonKey(name: 'playtime_hours')
  final int? playtimeHours;
  @override
  @JsonKey(name: 'completion_status')
  final String? completionStatus;
  @override
  final bool? recommended;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(ignore: true)
  final Game? game;

  @override
  String toString() {
    return 'Review(id: $id, userId: $userId, gameId: $gameId, title: $title, content: $content, overallRating: $overallRating, gameplayRating: $gameplayRating, graphicsRating: $graphicsRating, storyRating: $storyRating, soundRating: $soundRating, valueRating: $valueRating, pros: $pros, cons: $cons, playtimeHours: $playtimeHours, completionStatus: $completionStatus, recommended: $recommended, createdAt: $createdAt, game: $game)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.overallRating, overallRating) ||
                other.overallRating == overallRating) &&
            (identical(other.gameplayRating, gameplayRating) ||
                other.gameplayRating == gameplayRating) &&
            (identical(other.graphicsRating, graphicsRating) ||
                other.graphicsRating == graphicsRating) &&
            (identical(other.storyRating, storyRating) ||
                other.storyRating == storyRating) &&
            (identical(other.soundRating, soundRating) ||
                other.soundRating == soundRating) &&
            (identical(other.valueRating, valueRating) ||
                other.valueRating == valueRating) &&
            (identical(other.pros, pros) || other.pros == pros) &&
            (identical(other.cons, cons) || other.cons == cons) &&
            (identical(other.playtimeHours, playtimeHours) ||
                other.playtimeHours == playtimeHours) &&
            (identical(other.completionStatus, completionStatus) ||
                other.completionStatus == completionStatus) &&
            (identical(other.recommended, recommended) ||
                other.recommended == recommended) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.game, game) || other.game == game));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    gameId,
    title,
    content,
    overallRating,
    gameplayRating,
    graphicsRating,
    storyRating,
    soundRating,
    valueRating,
    pros,
    cons,
    playtimeHours,
    completionStatus,
    recommended,
    createdAt,
    game,
  );

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(this);
  }
}

abstract class _Review implements Review {
  const factory _Review({
    required final String id,
    @JsonKey(name: 'user_id') final String? userId,
    @JsonKey(name: 'game_id') final String? gameId,
    final String? title,
    final String? content,
    @JsonKey(name: 'overall_rating') final double? overallRating,
    @JsonKey(name: 'gameplay_rating') final double? gameplayRating,
    @JsonKey(name: 'graphics_rating') final double? graphicsRating,
    @JsonKey(name: 'story_rating') final double? storyRating,
    @JsonKey(name: 'sound_rating') final double? soundRating,
    @JsonKey(name: 'value_rating') final double? valueRating,
    @JsonKey(fromJson: _listOrStringToString) final String? pros,
    @JsonKey(fromJson: _listOrStringToString) final String? cons,
    @JsonKey(name: 'playtime_hours') final int? playtimeHours,
    @JsonKey(name: 'completion_status') final String? completionStatus,
    final bool? recommended,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(ignore: true) final Game? game,
  }) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'game_id')
  String? get gameId;
  @override
  String? get title;
  @override
  String? get content;
  @override
  @JsonKey(name: 'overall_rating')
  double? get overallRating;
  @override
  @JsonKey(name: 'gameplay_rating')
  double? get gameplayRating;
  @override
  @JsonKey(name: 'graphics_rating')
  double? get graphicsRating;
  @override
  @JsonKey(name: 'story_rating')
  double? get storyRating;
  @override
  @JsonKey(name: 'sound_rating')
  double? get soundRating;
  @override
  @JsonKey(name: 'value_rating')
  double? get valueRating;
  @override
  @JsonKey(fromJson: _listOrStringToString)
  String? get pros;
  @override
  @JsonKey(fromJson: _listOrStringToString)
  String? get cons;
  @override
  @JsonKey(name: 'playtime_hours')
  int? get playtimeHours;
  @override
  @JsonKey(name: 'completion_status')
  String? get completionStatus;
  @override
  bool? get recommended;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  Game? get game;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
