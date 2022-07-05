import 'package:flutter/material.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_gender.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_types_entity.dart';

class PokemonEntity {
  const PokemonEntity({
    required this.number,
    required this.name,
    required this.description,
    required this.types,
    required this.image,
    required this.height,
    required this.weight,
    required this.genera,
    required this.eggGroups,
    required this.gender,
    required this.stats,
    required this.baseExp,
    required this.evolutions,
    required this.evolutionReason,
  });

  final String number;
  final String name;
  final String description;
  final List<PokemonTypes> types;
  final String image;
  final String height;
  final String weight;
  final String genera;
  final List<String> eggGroups;
  final PokemonGender gender;
  final PokemonStats stats;
  final double baseExp;
  final List<PokemonEntity> evolutions;
  final String evolutionReason;
}

extension PokemonX on PokemonEntity {
  Color? get color => types.first.color;

  Map<PokemonTypes, double> get typeEffectiveness {
    final effectiveness = PokemonTypes.values
        .where((element) => element != PokemonTypes.unknown)
        .map(
          (type) => MapEntry(
            type,
            types
                .map((pokemonType) => pokemonType.effectiveness[type] ?? 1.0)
                .reduce((total, effectiveness) => total * effectiveness),
          ),
        );

    return Map.fromEntries(effectiveness);
  }
}
