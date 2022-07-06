import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_ability_entity.dart';

class Stats {
  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'] as int;
    effort = json['effort'] as int;
    stat = json['stat'] != null
        ? Ability.fromJson(json['stat'] as Map<String, dynamic>)
        : null;
  }
  int? baseStat;
  int? effort;
  Ability? stat;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}
