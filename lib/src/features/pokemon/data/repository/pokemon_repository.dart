import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_model.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);
  final Dio dio;

  Future<PokemonEntity?> fetchPokemonData({required String pokemon});

  Future<List<PokemonEntity>> getAllPokemons();

  Future<List<PokemonEntity>> getPokemons(
      {required int limit, required int page});

  Future<PokemonEntity?> getPokemon(String number);
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
        // return PokemonModel.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<List<PokemonEntity>> getAllPokemons() {
    // TODO: implement getAllPokemons
    throw UnimplementedError();
  }

  @override
  Future<PokemonEntity?> getPokemon(String number) {
    // TODO: implement getPokemon
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonEntity>> getPokemons(
      {required int limit, required int page}) {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }

  // @override
  // Future<List<PokemonEntity>> getAllPokemons() async {
  //   final hasCachedData = await localDataSource.hasData();
//
  //   if (!hasCachedData) {
  //     final pokemonGithubModels = await githubDataSource.getPokemons();
  //     final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());
//
  //     await localDataSource.savePokemons(pokemonHiveModels);
  //   }
//
  //   final pokemonHiveModels = await localDataSource.getAllPokemons();
//
  //   final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();
//
  //   return pokemonEntities;
  // }
//
  // @override
  // Future<List<PokemonEntity>> getPokemons({required int limit, required int page}) async {
  //   final hasCachedData = await localDataSource.hasData();
//
  //   if (!hasCachedData) {
  //     final pokemonGithubModels = await githubDataSource.getPokemons();
  //     final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());
//
  //     await localDataSource.savePokemons(pokemonHiveModels);
  //   }
//
  //   final pokemonHiveModels = await localDataSource.getPokemons(
  //     page: page,
  //     limit: limit,
  //   );
  //   final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();
//
  //   return pokemonEntities;
  // }
//
  // @override
  // Future<PokemonEntity?> getPokemon(String number) async {
  //   final pokemonModel = await localDataSource.getPokemon(number);
//
  //   if (pokemonModel == null) return null;
//
  //   // get all evolutions
  //   final evolutions = await localDataSource.getEvolutions(pokemonModel);
//
  //   final pokemon = pokemonModel.toEntity(evolutions: evolutions);
//
  //   return pokemon;
  // }
}
