class PokemonModel {
  PokemonModel({this.count, this.next, this.results});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
  int? count;
  String? next;
  List<Results>? results;
}

class Results {
  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;
}
