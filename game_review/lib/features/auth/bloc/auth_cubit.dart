import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    try {
      // TEMPORARY: Added a delay to ensure the check has time to finish.
      await Future.delayed(const Duration(seconds: 1));

      final token = await SecureStorage.getToken();
      if (token != null) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    final success = await _authService.login(email, password);
    if (success) {
      emit(Authenticated());
    }
    // TODO: Handle login failure
  }

  Future<void> logout() async {
    await _authService.logout();
    emit(Unauthenticated());
  }
}