part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthenticationEvent {
  SignInRequested(this.email, this.password);

  final String email;
  final String password;
}

class SignUpRequested extends AuthenticationEvent {
  SignUpRequested(this.email, this.password);

  final String email;
  final String password;
}

class GoogleSignInRequested extends AuthenticationEvent {}

class FacebookSignInRequested extends AuthenticationEvent {}

class SignOutRequested extends AuthenticationEvent {}
