import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon.dart';

extension ResultExtension on Results {
  String getId() {
    return this.url!.substring((this.url!.length - 2), (this.url!.length - 1));
  }
}
