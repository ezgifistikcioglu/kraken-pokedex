import 'package:json_annotation/json_annotation.dart';
part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  PokemonModel({this.count, this.next, this.results});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  int? count;
  String? next;
  List<Results>? results;
}

@JsonSerializable()
class Results {
  Results({this.name, this.url});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  String? name;
  String? url;
}
