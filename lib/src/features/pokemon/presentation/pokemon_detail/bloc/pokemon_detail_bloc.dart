import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/service/project_dio.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_detail_model.dart';

part 'pokemon_detail_bloc_event.dart';
part 'pokemon_detail_bloc_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState>
    with ProjectDioMixin {
  PokemonDetailBloc() : super(PokemonDetailBlocInitial()) {
    final _pokemonService = PokemonService(service);

    on<FetchDetails>((event, emit) async {
      emit(PokemonDetailLoading());
      try {
        final result = await _pokemonService.fetchDetailPokemon(event.url);
        add(DisplayDetails(result!));
      } on Exception catch (e) {
        emit(PokemonDetailError("Error mesage"));
      }
    });

    on<DisplayDetails>((event, emit) async {
      emit(PokemonDetailSuccess(event.pokemonDetailModel));
    });
  }
}
