part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetails extends PokemonDetailEvent {
  final String url;

  FetchDetails(this.url);
}

class DisplayDetails extends PokemonDetailEvent {
  final PokemonDetailModel pokemonDetailModel;

  DisplayDetails(this.pokemonDetailModel);
}
