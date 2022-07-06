part of 'pokemon_list_bloc.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

abstract class PokemonListState {}

class PokemonInitialState extends PokemonListState {}

class PokemonLoadingState extends PokemonListState {}

class PokemonSuccessState extends PokemonListState {
  final List<Results>? resultList;
  PokemonSuccessState({required this.resultList});
}

class PokemonErrorState extends PokemonListState {
  final String errorMessage;
  PokemonErrorState({required this.errorMessage});
}
