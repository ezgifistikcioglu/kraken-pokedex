part of 'pokemon_list_bloc.dart';

abstract class PokemonListState {}

class PokemonInitialState extends PokemonListState {}

class PokemonLoadingState extends PokemonListState {}

class PokemonSuccessState extends PokemonListState {
  PokemonSuccessState({required this.resultList});
  final List<Results>? resultList;
}

class PokemonErrorState extends PokemonListState {
  PokemonErrorState({required this.errorMessage});
  final String errorMessage;
}
