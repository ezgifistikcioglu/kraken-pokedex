import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/service/project_dio.dart';

import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState>
    with ProjectDioMixin {
  PokemonListBloc() : super(PokemonInitialState()) {
    final _pokemonService = PokemonService(service);

    on<PokemonListEvent>((event, emit) async {
      emit(PokemonLoadingState());
      try {
        final result = await _pokemonService.fetchPokemonList();
        emit(PokemonSuccessState(resultList: result?.results));
      } on Exception catch (e) {
        emit(PokemonErrorState(errorMessage: e.toString()));
      }
    });
  }
}
