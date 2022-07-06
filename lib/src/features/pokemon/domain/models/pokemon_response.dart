import 'package:json_annotation/json_annotation.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon.dart';
part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  PokemonResponse({required this.data});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  @JsonKey(defaultValue: [])
  final List<PokemonModel> data;

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
