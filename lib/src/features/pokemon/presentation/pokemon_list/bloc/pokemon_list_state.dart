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

class PokemonListStatee extends Equatable {
  const PokemonListStatee._({
    this.status = PokemonStateStatus.initial,
    this.pokemons = const [],
    this.selectedPokemonIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  //const PokemonListState.initial() : this._();
  final PokemonStateStatus status;
  final List<PokemonModel> pokemons;
  final int selectedPokemonIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  PokemonModel get selectedPokemon => pokemons[selectedPokemonIndex];

  PokemonListStatee asLoading() {
    return copyWith(
      status: PokemonStateStatus.loading,
    );
  }

  PokemonListStatee asLoadSuccess(List<PokemonModel> pokemons,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadSuccess,
      pokemons: pokemons,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PokemonListStatee asLoadFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadFailure,
      error: e,
    );
  }

  PokemonListStatee asLoadingMore() {
    return copyWith(status: PokemonStateStatus.loadingMore);
  }

  PokemonListStatee asLoadMoreSuccess(List<PokemonModel> newPokemons,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadMoreSuccess,
      pokemons: [...pokemons, ...newPokemons],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PokemonListStatee asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PokemonListStatee copyWith({
    PokemonStateStatus? status,
    List<PokemonModel>? pokemons,
    int? selectedPokemonIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PokemonListStatee._(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      selectedPokemonIndex: selectedPokemonIndex ?? this.selectedPokemonIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [];
}

class PokemonInitialState extends PokemonListState {}

class PokemonLoadingState extends PokemonListState {}

class PokemonSuccessState extends PokemonListState {
  final List<PokemonModel>? pokemonList;
  PokemonSuccessState({required this.pokemonList});
}

class PokemonSuccessState2 extends PokemonListState {
  final PokemonModel? pokemonList;
  PokemonSuccessState2({required this.pokemonList});
}

class PokemonErrorState extends PokemonListState {
  final String errorMessage;
  PokemonErrorState({required this.errorMessage});
}
