import 'package:equatable/equatable.dart';
import 'package:game_review/features/profile_screen/models/user.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class DataChangeSuccess extends UserProfileState {
  final String message;
  const DataChangeSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UserProfileLoaded extends UserProfileState {
  final User user;
  final String? loggedUserId;
  final bool? alreadyFriends;
  const UserProfileLoaded(this.user, this.loggedUserId, this.alreadyFriends);

  @override
  List<Object?> get props => [user];
}

class UserProfileError extends UserProfileState {
  final String message;
  const UserProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
