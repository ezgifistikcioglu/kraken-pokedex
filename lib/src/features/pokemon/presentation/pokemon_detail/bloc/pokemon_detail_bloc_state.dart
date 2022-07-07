part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

class PokemonDetailBlocInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailSuccess extends PokemonDetailState {

  const PokemonDetailSuccess(this.model);
  final PokemonDetailModel model;
}

class PokemonDetailError extends PokemonDetailState {

  const PokemonDetailError(this.errorMesage);
  final String errorMesage;
}
