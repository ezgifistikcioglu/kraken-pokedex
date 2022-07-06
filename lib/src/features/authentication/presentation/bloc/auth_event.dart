part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthenticationEvent {
  LoginRequested(this.email, this.password);

  final String email;
  final String password;
}

class SignUpRequested extends AuthenticationEvent {
  SignUpRequested(this.email, this.password);

  final String email;
  final String password;
}

class GoogleLoginRequested extends AuthenticationEvent {}

class FacebookLoginRequested extends AuthenticationEvent {}

class LogOutRequested extends AuthenticationEvent {}
