import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/auth/services/auth_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'auth_state.dart';

// TODO: handle token expiration and refresh

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    try {
      final token = SecureStorage.getToken();
      if (token != null) {
        emit(Authenticated());
      } else {
        emit(const Unauthenticated());
      }
    } catch (e, stackTrace) {
      Logger.error(t.errors.authenticationFail, '$e\n$stackTrace');
      emit(const Unauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final success = await _authService.login(email, password);
      if (success) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated(t.errors.invalidCredentials));
      }
    } catch (e) {
      Logger.error(t.errors.loginFailed, e);
      emit(Unauthenticated(t.errors.loginFailed));
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    emit(const Unauthenticated());
  }
}
