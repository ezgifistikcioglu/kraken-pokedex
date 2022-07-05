import 'package:json_annotation/json_annotation.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_ability_entity.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_moves_entity.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_stats_entity.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_types_entity.dart';
part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  PokemonModel(
    this.name,
    this.id,
    this.url,
    this.types,
    this.abilities,
    this.moves,
    this.stats,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final String? name;

  @JsonKey(required: true, disallowNullValue: true)
  final String? id;

  @JsonKey()
  final String url;

  @JsonKey()
  final List<Types>? types;

  @JsonKey(defaultValue: [])
  final List<Ability>? abilities;

  @JsonKey(defaultValue: [])
  final List<Moves>? moves;

  @JsonKey(defaultValue: [])
  final List<Stats>? stats;
}
