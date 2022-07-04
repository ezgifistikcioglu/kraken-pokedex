part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonPageRequest extends PokemonListEvent {
  final int page;

  PokemonPageRequest({required this.page});
}

class PokemonFetched extends PokemonListEvent {
  final String pokemon;

  PokemonFetched({required this.pokemon});
}
