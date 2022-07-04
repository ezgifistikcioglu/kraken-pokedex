part of 'pokemon_list_bloc.dart';

abstract class PokemonListState extends Equatable {}

// When the user presses the sign-in or sign-up button,
// the state changes to loading first and then Authenticated.
class Loading extends PokemonListState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated, the state is changed to Authenticated.
class Authenticated extends PokemonListState {
  @override
  List<Object?> get props => [];
}

class UnFound extends PokemonListState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthenticationError extends PokemonListState {
  AuthenticationError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
