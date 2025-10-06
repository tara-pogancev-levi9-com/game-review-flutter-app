import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();


  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {
  final bool isFormValid;
  const RegistrationInitial({this.isFormValid = false});
  @override
  List<Object?> get props => [isFormValid];
}
class RegistrationFirstTime extends RegistrationState {}
class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}
class LoginSuccess extends RegistrationState {}
class LoginFailure extends RegistrationState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class RegistrationFailure extends RegistrationState {
  final String error;
  const RegistrationFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class RegistrationFailureCleared extends RegistrationState {}
