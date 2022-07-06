import 'package:json_annotation/json_annotation.dart';
part 'pokemon.g.dart';

@JsonSerializable()
class PokemonModel {
  PokemonModel({this.count, this.next, this.results});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int;
    next = json['next'] as String;

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v as Map<String, dynamic>));
      });
    }
  }
  int? count;
  String? next;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Results {
  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    url = json['url'] as String;
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
