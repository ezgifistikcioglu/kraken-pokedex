import 'package:json_annotation/json_annotation.dart';
part 'pokemon_detail_model.g.dart';

@JsonSerializable()
class PokemonDetailModel {
  PokemonDetailModel({
    this.abilities,
    this.baseExperience,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
  List<Abilities>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  Ability? species;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;
}

@JsonSerializable()
class Abilities {
  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);
  Ability? ability;
  bool? isHidden;
  int? slot;
}

@JsonSerializable()
class Ability {
  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  String? name;
  String? url;
}

@JsonSerializable()
class Moves {
  Moves({this.move});
  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Ability? move;
}

@JsonSerializable()
class Stats {
  Stats({this.baseStat, this.effort, this.stat});
  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  int? baseStat;
  int? effort;
  Ability? stat;
}

@JsonSerializable()
class Types {
  Types({this.slot, this.type});
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
  int? slot;
  Ability? type;
}
