part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetails extends PokemonDetailEvent {
  const FetchDetails(this.url);
  final String url;
}

class DisplayDetails extends PokemonDetailEvent {
  const DisplayDetails(this.pokemonDetailModel);
  final PokemonDetailModel pokemonDetailModel;
}
