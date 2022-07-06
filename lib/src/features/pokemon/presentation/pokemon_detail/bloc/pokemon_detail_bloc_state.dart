part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

class PokemonDetailBlocInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailSuccess extends PokemonDetailState {
  final PokemonDetailModel model;

  PokemonDetailSuccess(this.model);
}

class PokemonDetailError extends PokemonDetailState {
  final String errorMesage;

  PokemonDetailError(this.errorMesage);
}
