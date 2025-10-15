import 'package:bloc/bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/exceptions/password_same.dart';
import 'package:game_review/features/profile_screen/models/profile_Info_model.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class UserCubit extends Cubit<UserProfileState> {
  final UserService _userService = locator<UserService>();

  UserCubit() : super(const UserProfileState.loading());

  Future<void> initData() async {
    try {
      final currentUserId = await getCurrentUserId();
      await fetchUserProfile(currentUserId, null);
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
          : await _userService.checkFriendship(userId, loggedUserId!);
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

  Future<void> updateAvatar(userId, imageUrl) async {
    try {
      await _userService.updateUserProfile(userId, {'avatar_url': imageUrl});
      await fetchUserProfile(null, t.avatarUpdated);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<void> updateProfileInfo(userId, ProfileInfoModel data) async {
    try {
      await _userService.updateUserProfile(userId, {
        'username': data.username,
        'display_name': data.displayName,
        'bio': data.bio,
      });
      await fetchUserProfile(null, t.profileUpdated);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }

  Future<void> changePassword(newPassword, user) async {
    try {
      emit(UserProfileState.loading());
      await _userService.changePassword(newPassword);
      emit(
        UserProfileState.loaded(
          user: user,
          loggedUserId: null,
          alreadyFriends: null,
          message: t.passwordChanged,
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
          message: t.errorChangingPassword,
        ),
      );
    }
  }

  Future<void> deleteAvatar(userId, imagePath) async {
    try {
      await _userService.deleteAvatar(imagePath, userId);
      await fetchUserProfile(null, t.avatarRemoved);
    } catch (e) {
      emit(UserProfileState.error(message: e.toString()));
    }
  }
}
