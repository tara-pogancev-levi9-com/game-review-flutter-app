import 'package:bloc/bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';

class UserCubit extends Cubit<UserProfileState> {
  final UserService _userService = locator<UserService>();

  UserCubit() : super(UserProfileInitial());

  Future<void> fetchUserProfile() async {
    try {
      emit(UserProfileLoading());
      final user = await _userService.getCurrentUser();
      emit(UserProfileLoaded(user));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
