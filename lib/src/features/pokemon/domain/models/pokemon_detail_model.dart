import 'package:json_annotation/json_annotation.dart';
part 'pokemon_detail_model.g.dart';

@JsonSerializable()
class PokemonDetailModel {
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

  PokemonDetailModel(
      {this.abilities,
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
      this.weight});

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
}

@JsonSerializable()
class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);
}

@JsonSerializable()
class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@JsonSerializable()
class Moves {
  Ability? move;

  Moves({this.move});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}

@JsonSerializable()
class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@JsonSerializable()
class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}
