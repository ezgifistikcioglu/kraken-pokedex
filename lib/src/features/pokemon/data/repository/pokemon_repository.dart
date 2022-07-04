import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_model.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);
  final Dio dio;

  Future<PokemonEntity?> fetchPokemonData({required String pokemon});
}

enum _PokemonPaths { pokemon, ability, type }

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<PokemonEntity?> fetchPokemonData({required String pokemon}) async {
    final response = await dio.get(
      '/${_PokemonPaths.pokemon.name}',
    ); //"https://pokeapi.co/api/v2/pokemon/$pokemon"
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return PokemonModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
