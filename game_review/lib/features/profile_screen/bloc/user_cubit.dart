import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/exceptions/password_same.dart';
import 'package:game_review/features/profile_screen/models/profile_Info_model.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';

class UserCubit extends Cubit<UserProfileState> {
  final UserService _userService = locator<UserService>();

  UserCubit() : super(UserProfileInitial());

  Future<void> fetchUserProfile(String? userId) async {
    try {
      emit(UserProfileLoading());

      final user = (userId == null)
          ? await _userService.getCurrentUser()
          : await _userService.getUser(userId);
      final loggedUserId = (userId == null) ? null : await getCurrentUserId();

      final alreadyFriends = (userId == null)
          ? null
          : await checkFriendshipStatus(userId, loggedUserId!);
      emit(UserProfileLoaded(user, loggedUserId, alreadyFriends));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> addFriend(requesterId, addresseeId) async {
    try {
      await _userService.addFriend(requesterId, addresseeId);
    } catch (e) {
      print("ERROR: " + e.toString());
      emit(UserProfileError(e.toString()));
    }
  }

  Future<bool> checkFriendshipStatus(String userId, String otherUserId) async {
    try {
      return await _userService.checkFriendship(userId, otherUserId);
    } on DioException catch (e) {
      return false;
    }
  }

  Future<String> getCurrentUserId() {
    try {
      final userId = _userService.getCurrentUserUid();
      return userId;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateAvatar(userId, imageUrl) async {
    try {
      await _userService.updateUserProfile(userId, {'avatar_url': imageUrl});
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> updateProfileInfo(userId, ProfileInfoModel data) async {
    try {
      await _userService.updateUserProfile(userId, {
        'username': data.username,
        'display_name': data.displayName,
        'bio': data.bio,
      });
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> changePassword(newPassword) async {
    try {
      await _userService.changePassword(newPassword);
      emit(DataChangeSuccess("Password Changed!"));
    } on PasswordSameAsOldException catch (e) {
      emit(UserProfileError(e.message));
    } catch (e) {
      emit(UserProfileError("Error occurred while changing password!"));
    }
  }

  /*Future<void> uploadNewAvatar(userId, imageUrl) async {
    try {
      await _userService.uploadNewAvatar(userId, {'avatar_url': imageUrl});
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }*/

  Future<void> deleteAvatar(userId, imagePath) async {
    try {
      _userService.deleteAvatar(imagePath, userId);
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
