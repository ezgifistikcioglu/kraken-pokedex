import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kraken_pokedex/src/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/service/project_dio.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState>
    with ProjectDioMixin {
  PokemonListBloc(super.initialState);
// PokemonListBloc(PokemonInitial()) : super(UnFound()) {
//   final _pokemonService = PokemonService(service);
//
//
//   on<PokemonLoadStarted>(
//     _onLoadStarted,
//     transformer: (events, mapper) => events.switchMap(mapper),
//   );
//   on<PokemonLoadMoreStarted>(
//     _onLoadMoreStarted,
//     transformer: (events, mapper) => events.switchMap(mapper),
//   );
//   on<PokemonFetched>(_onSelectChanged);
// }
//       static const int pokemonsPerPage = 50;
//
// void _onLoadStarted(PokemonLoadStarted event, Emitter<PokemonListState> emit) async {
//   try {
//     emit(state.asLoading());
//
//     final pokemons = event.loadAll
//         ? await _pokemonRepository.getAllPokemons()
//         : await _pokemonRepository.getPokemons(page: 1, limit: pokemonsPerPage);
//
//     final canLoadMore = pokemons.length >= pokemonsPerPage;
//
//     emit(state.asLoadSuccess(pokemons, canLoadMore: canLoadMore));
//   } on Exception catch (e) {
//     emit(state.asLoadFailure(e));
//   }
// }
//
// void _onLoadMoreStarted(PokemonLoadMoreStarted event, Emitter<PokemonListState> emit) async {
//   try {
//     if (!state.canLoadMore) return;
//
//     emit(state.asLoadingMore());
//
//     final pokemons = await _pokemonRepository.getPokemons(
//       page: state.page + 1,
//       limit: pokemonsPerPage,
//     );
//
//     final canLoadMore = pokemons.length >= pokemonsPerPage;
//
//     emit(state.asLoadMoreSuccess(pokemons, canLoadMore: canLoadMore));
//   } on Exception catch (e) {
//     emit(state.asLoadMoreFailure(e));
//   }
// }
//
// void _onSelectChanged(PokemonFetched event, Emitter<PokemonListState> emit) async {
//   try {
//     final pokemonIndex = state.pokemons.indexWhere(
//       (pokemon) => pokemon.number == event.pokemonId,
//     );
//
//     if (pokemonIndex < 0 || pokemonIndex >= state.pokemons.length) return;
//
//     final pokemon = await _pokemonRepository.getPokemon(event.pokemonId);
//
//     if (pokemon == null) return;
//
//     emit(state.copyWith(
//       pokemons: state.pokemons..setAll(pokemonIndex, [pokemon]),
//       selectedPokemonIndex: pokemonIndex,
//     ));
//   } on Exception catch (e) {
//     emit(state.asLoadMoreFailure(e));
//   }
// }
//
//   //    Future<PokemonEntity> getPokemon({required String pokemon}) async {
//   //  var result = await _repository
//   //      .fetchPokemonData(pokemon: pokemon)
//   //      .onError((error, stackTrace) => throw Error());
//   //  return result;
//   //}

}
