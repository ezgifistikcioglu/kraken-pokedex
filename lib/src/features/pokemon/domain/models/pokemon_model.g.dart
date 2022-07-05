// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'id'],
    disallowNullValues: const ['name', 'id'],
  );
  return PokemonModel(
    json['name'] as String?,
    json['id'] as String?,
    json['url'] as String,
    (json['types'] as List<dynamic>?)
        ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['abilities'] as List<dynamic>?)
            ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    (json['moves'] as List<dynamic>?)
            ?.map((e) => Moves.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    (json['stats'] as List<dynamic>?)
            ?.map((e) => Stats.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  val['url'] = instance.url;
  val['types'] = instance.types;
  val['abilities'] = instance.abilities;
  val['moves'] = instance.moves;
  val['stats'] = instance.stats;
  return val;
}
