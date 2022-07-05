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

class PokemonListState extends Equatable {
  const PokemonListState._({
    this.status = PokemonStateStatus.initial,
    this.pokemons = const [],
    this.selectedPokemonIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PokemonListState.initial() : this._();
  final PokemonStateStatus status;
  final List<PokemonEntity> pokemons;
  final int selectedPokemonIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  PokemonEntity get selectedPokemon => pokemons[selectedPokemonIndex];

  PokemonListState asLoading() {
    return copyWith(
      status: PokemonStateStatus.loading,
    );
  }

  PokemonListState asLoadSuccess(List<PokemonEntity> pokemons,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadSuccess,
      pokemons: pokemons,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PokemonListState asLoadFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadFailure,
      error: e,
    );
  }

  PokemonListState asLoadingMore() {
    return copyWith(status: PokemonStateStatus.loadingMore);
  }

  PokemonListState asLoadMoreSuccess(List<PokemonEntity> newPokemons,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadMoreSuccess,
      pokemons: [...pokemons, ...newPokemons],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PokemonListState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PokemonListState copyWith({
    PokemonStateStatus? status,
    List<PokemonEntity>? pokemons,
    int? selectedPokemonIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PokemonListState._(
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
