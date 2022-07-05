part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {}

// When the user presses the sign-in or sign-up button,
// the state changes to loading first and then Authenticated.
class Loading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated, the state is changed to Authenticated.
class Authenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc.
// When the user is not authenticated, the state is changed to Unauthenticated.
class UnAuthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthenticationError extends AuthenticationState {
  AuthenticationError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
