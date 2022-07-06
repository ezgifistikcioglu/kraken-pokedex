part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {}

class Loading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationError extends AuthenticationState {
  AuthenticationError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
