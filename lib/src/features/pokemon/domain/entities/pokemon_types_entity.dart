import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_ability_entity.dart';

class Types {
  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] as int;
    type = json['type'] != null
        ? Ability.fromJson(json['type'] as Map<String, dynamic>)
        : null;
  }
  int? slot;
  Ability? type;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
