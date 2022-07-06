import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/pokemon/data/service/api_service.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_list/bloc/pokemon_list_bloc.dart';

class PokemonListViewScreen extends StatefulWidget {
  const PokemonListViewScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListViewScreen> createState() => _PokemonListViewScreenState();
}

class _PokemonListViewScreenState extends State<PokemonListViewScreen> {
  late ApiService service;

  List<PokemonModel> postList = <PokemonModel>[];

  @override
  void initState() {
    service = ApiService.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PokemonListBloc()..add(PokemonFetched()),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: BlocBuilder<PokemonListBloc, PokemonListState>(
            builder: (context, state) {
              if (state is PokemonLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PokemonErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is PokemonSuccessState) {
                return Padding(
                  padding: ApplicationConstants.normal2xPadding,
                  child: _contentGridView(state),
                );
              }
              return Container();
            },
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  GridView _contentGridView(PokemonSuccessState state) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: state.pokemonList?.length,
      itemBuilder: (context, index) {
        return Card(
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.network(state.pokemonList?[index].url),
                Text(state.pokemonList?[index].toString() ?? '')
              ],
            ),
          ),
        );
      },
    );
  }
}
