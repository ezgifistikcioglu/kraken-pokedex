import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_detail_model.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_model.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);
  final Dio dio;

  Future<PokemonModel?> fetchPokemonList();
  Future<PokemonDetailModel?> fetchDetailPokemon(String url);
}

enum _PokemonPaths { pokemon, ability, type }

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  Future<PokemonModel?> fetchPokemonData() async {
    final response = await dio.get(
      '/${_PokemonPaths.pokemon.name}',
    );
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return PokemonModel.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonList() async {
    final resp =
        await dio.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=50');
    final jsonBody = resp.data;
    if (resp.statusCode == HttpStatus.ok) {
      if (jsonBody is Map<String, dynamic>) {
        return PokemonModel.fromJson(jsonBody);
      }
    } else {
      throw Exception('Failed to load pokemon list');
    }
    return null;
  }

  @override
  Future<PokemonDetailModel?> fetchDetailPokemon(String url) async {
    final resp = await dio.get(url);
    final jsonBody = resp.data;
    if (resp.statusCode == HttpStatus.ok) {
      if (jsonBody is Map<String, dynamic>) {
        return PokemonDetailModel.fromJson(jsonBody);
      }
    } else {
      throw Exception('Failed to load pokemon list');
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
