import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/models.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserProfileState with _$UserProfileState {
  const factory UserProfileState.loading() = _UserProfileLoading;

  const factory UserProfileState.loaded({
    required UserModel user,
    required String? loggedUserId,
    required bool? alreadyFriends,
    required String? message,
  }) = _UserProfileLoaded;

  const factory UserProfileState.error({required String message}) =
      _UserProfileError;
}
