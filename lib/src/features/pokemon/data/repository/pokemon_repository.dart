import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_model.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_response.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);
  final Dio dio;

  Future<PokemonModel?> fetchPokemonData();
}

enum _PokemonPaths { pokemon, ability, type }

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<PokemonModel?> fetchPokemonData() async {
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

  Future<List<PokemonModel>?> fetchPokemonList() async {
    final resp = await dio.get('/${_PokemonPaths.ability.name}');
    final jsonBody = resp.data;
    if (resp.statusCode == HttpStatus.ok) {
      if (jsonBody is Map<String, dynamic>) {
        return PokemonResponse.fromJson(jsonBody).data;
      }
    } else {
      throw Exception('Failed to load pokemon list');
    }
    return null;
  }

  Future<List<PokemonModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await dio.get('/${_PokemonPaths.ability.name}');
      if (response.statusCode == HttpStatus.ok) {
        final _myDatas = response.data;

        if (_myDatas is List) {
          return _myDatas.map((e) => PokemonModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
