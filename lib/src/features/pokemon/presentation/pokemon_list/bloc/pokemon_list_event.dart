part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();
  @override
  List<Object> get props => [];
}

class PokemonLoadStarted extends PokemonListEvent {
  final bool loadAll;

  PokemonLoadStarted({this.loadAll = false});
}

class PokemonLoadMoreStarted extends PokemonListEvent {}

class PokemonFetched extends PokemonListEvent {}
