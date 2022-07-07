// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
