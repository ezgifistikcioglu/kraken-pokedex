import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kraken_pokedex/src/features/authentication/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<LoginRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.logIn(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<GoogleLoginRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.loginWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<FacebookLoginRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.loginWithFacebook();
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<LogOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.logOut();
      emit(UnAuthenticated());
    });
  }
  final AuthRepository authRepository;
}
