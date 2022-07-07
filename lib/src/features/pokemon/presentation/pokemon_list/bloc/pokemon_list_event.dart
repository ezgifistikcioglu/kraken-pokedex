part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();
  @override
  List<Object> get props => [];
}

class PokemonLoadStarted extends PokemonListEvent {
  const PokemonLoadStarted({this.loadAll = false});
  final bool loadAll;
}

class PokemonLoadMoreStarted extends PokemonListEvent {}

class PokemonFetched extends PokemonListEvent {}
