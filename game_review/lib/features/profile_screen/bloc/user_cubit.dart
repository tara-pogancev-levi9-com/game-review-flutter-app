import 'package:bloc/bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/user_model.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/exceptions/password_same.dart';
import 'package:game_review/features/profile_screen/models/profile_info_model.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class UserCubit extends Cubit<UserProfileState> {
  final UserService _userService = locator<UserService>();

  UserCubit() : super(const UserProfileState.loading());

  Future<void> initData(String? userId) async {
    try {
      await fetchUserProfile(userId, null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> fetchUserProfile(String? userId, String? message) async {
    try {
      emit(UserProfileState.loading());

      final user = (userId == null)
          ? await _userService.getCurrentUser()
          : await _userService.getUser(userId);
      final loggedUserId = (userId == null) ? null : await getCurrentUserId();

      final alreadyFriends = (userId == null)
          ? null
          : await _userService.areFriends(userId, loggedUserId!);
      emit(
        UserProfileState.loaded(
          user: user,
          loggedUserId: loggedUserId,
          alreadyFriends: alreadyFriends,
          message: message,
        ),
      );
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<void> addFriend(requesterId, addresseeId) async {
    try {
      await _userService.addFriend(requesterId, addresseeId);
      await fetchUserProfile(addresseeId, null);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<String> getCurrentUserId() async {
    try {
      final userId = await _userService.getCurrentUserUid();
      return userId;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateAvatar(String userId, String imageUrl) async {
    try {
      await _userService.updateUserProfile(userId, {'avatar_url': imageUrl});
      await fetchUserProfile(null, t.profile.avatarUpdated);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<void> updateProfileInfo(String userId, ProfileInfoModel data) async {
    try {
      await _userService.updateUserProfile(userId, {
        'username': data.username,
        'display_name': data.displayName,
        'bio': data.bio,
      });
      await fetchUserProfile(null, t.profile.profileUpdated);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<void> changePassword(String newPassword, UserModel user) async {
    try {
      emit(UserProfileState.loading());
      await _userService.changePassword(newPassword);
      emit(
        UserProfileState.loaded(
          user: user,
          loggedUserId: null,
          alreadyFriends: null,
          message: t.auth.passwordChanged,
        ),
      );
    } on PasswordSameAsOldException catch (e) {
      emit(
        UserProfileState.loaded(
          user: user,
          message: e.message,
          loggedUserId: null,
          alreadyFriends: null,
        ),
      );
    } catch (e) {
      emit(
        UserProfileState.error(
          message: t.auth.errorChangingPassword,
        ),
      );
    }
  }

  Future<void> deleteAvatar(String userId, String imagePath) async {
    try {
      await _userService.deleteAvatar(imagePath, userId);
      await fetchUserProfile(null, t.profile.avatarRemoved);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }
}
