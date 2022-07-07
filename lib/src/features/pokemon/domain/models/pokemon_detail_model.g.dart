// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailModel(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['baseExperience'] as int?,
      height: json['height'] as int?,
      id: json['id'] as int?,
      isDefault: json['isDefault'] as bool?,
      locationAreaEncounters: json['locationAreaEncounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => Moves.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      species: json['species'] == null
          ? null
          : Ability.fromJson(json['species'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: json['ability'] == null
          ? null
          : Ability.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['isHidden'] as bool?,
      slot: json['slot'] as int?,
    );

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      move: json['move'] == null
          ? null
          : Ability.fromJson(json['move'] as Map<String, dynamic>),
    );

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      baseStat: json['baseStat'] as int?,
      effort: json['effort'] as int?,
      stat: json['stat'] == null
          ? null
          : Ability.fromJson(json['stat'] as Map<String, dynamic>),
    );

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : Ability.fromJson(json['type'] as Map<String, dynamic>),
    );
