import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {} 

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {
  final String? errorMessage;  
  const Unauthenticated([this.errorMessage]);
  
  @override
  List<Object> get props => [errorMessage ?? ''];
}