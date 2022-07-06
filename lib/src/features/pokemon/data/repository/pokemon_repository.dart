import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_detail_model.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon.dart';

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

  Future<PokemonModel?> fetchPokemonList() async {
    final resp =
        await dio.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=50');
    final jsonBody = resp.data;
    if (resp.statusCode == HttpStatus.ok) {
      if (jsonBody is Map<String, dynamic>) {
        //List<dynamic> list = jsonBody["results"] as List;
        //return list
        //    .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
        //    .toList();
        return PokemonModel.fromJson(jsonBody);
      }
    } else {
      throw Exception('Failed to load pokemon list');
    }
    return null;
  }

  Future<PokemonDetailModel?> fetchDetailPokemon(String url) async {
    final resp = await dio.get(url);
    final jsonBody = resp.data;
    if (resp.statusCode == HttpStatus.ok) {
      if (jsonBody is Map<String, dynamic>) {
        print(jsonEncode(jsonBody));
        //List<dynamic> list = jsonBody["results"] as List;
        //return list
        //    .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
        //    .toList();
        return PokemonDetailModel.fromJson(jsonBody);
      }
    } else {
      throw Exception('Failed to load pokemon list');
    }
    return null;
  }

  Future<List<PokemonModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await dio.get('/1');
      if (response.statusCode == HttpStatus.ok) {
        final _myDatas = response.data;

        if (_myDatas is List) {
          return _myDatas
              .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
              .toList();
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
