import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/registration_screen/bloc/registration_state.dart';
import 'package:game_review/features/registration_screen/exceptions/email_already_exists.dart';
import 'package:game_review/features/registration_screen/models/login_model.dart';
import 'package:game_review/features/registration_screen/models/registration_model.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService _authService = locator<AuthService>();

  RegistrationCubit() : super(RegistrationFirstTime());

  Future<void> signup(RegistrationModel data) async {
    emit(RegistrationLoading());
    try {
      await _authService.signup(data.email, data.password, data.username);
      emit(RegistrationSuccess());
    } on EmailAlreadyExistsException catch (e) {
      emit(RegistrationFailure(e.message));
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  Future<void> login(LoginModel data) async {
    try {
      await _authService.login(data.email, data.password);
      emit(LoginAfterRegistrationSuccess());
    } catch (e) {
      emit(LoginAfterRegistrationFailure(e.toString()));
    }
  }
}
