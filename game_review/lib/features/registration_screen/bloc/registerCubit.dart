import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/registration_screen/bloc/registrationState.dart';
import 'package:game_review/features/registration_screen/models/registrationModel.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService _authService = locator<AuthService>();

  RegistrationCubit() : super(RegistrationInitial());

  Future<void> signup(RegistrationModel data) async {
    emit(RegistrationLoading());
      try {
        await _authService.signup(data.email, data.password);
        emit(RegistrationSuccess());
      } catch (e) {
        emit(RegistrationFailure(e.toString()));
      }

  }
}