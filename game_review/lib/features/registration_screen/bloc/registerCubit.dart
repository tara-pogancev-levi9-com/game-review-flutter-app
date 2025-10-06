import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/registration_screen/bloc/registrationState.dart';
import 'package:game_review/features/registration_screen/models/loginModel.dart';
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
  Future<void> login(LoginModel data) async{
    try{
      await _authService.login(data.email, data.password);
      emit(LoginSuccess());
    } catch (e){
      emit(LoginFailure(e.toString()));
    }
  }
  void clearFailure() {
    emit(RegistrationInitial());
  }

  void formValidityChanged({required bool isFormValid}) {
    if (state is RegistrationInitial) {
      emit(RegistrationInitial(isFormValid: isFormValid));
    }
  }
}