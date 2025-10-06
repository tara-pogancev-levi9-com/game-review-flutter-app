import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'auth_service.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthIdle extends AuthState {
  const AuthIdle();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit({required this.authService}) : super(const AuthIdle());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    try {
      final bool ok = await authService.login(email, password);
      if (ok) {
        emit(const AuthSuccess());
      } else {
        emit(AuthError(t.errors.invalidCredentials));
      }
    } catch (e, s) {
      print(s);
      emit(AuthError(e.toString()));
    }
  }
}
