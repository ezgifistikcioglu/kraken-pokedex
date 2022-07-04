import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kraken_pokedex/src/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/service/project_dio.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState>
    with ProjectDioMixin {
  PokemonListBloc(PokemonInitial()) : super(UnFound()) {
    final _pokemonService = PokemonService(service);

    on<PokemonEntity>(
        (PokemonFetched event, Emitter<PokemonListState> emit) async {
      emit(Loading());
      try {
        await _pokemonService
            .fetchPokemonData(pokemon: pokemon)
            .onError((error, stackTrace) => throw Error());
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
        emit(UnFound());
      }
    });

    //    Future<PokemonEntity> getPokemon({required String pokemon}) async {
    //  var result = await _repository
    //      .fetchPokemonData(pokemon: pokemon)
    //      .onError((error, stackTrace) => throw Error());
    //  return result;
    //}
  }
}
