import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_detail_model.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_detail/bloc/pokemon_detail_bloc.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PokemonDetailBloc()..add(FetchDetails(widget.url)),
      child: Scaffold(
        appBar: _appBar(context),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
            builder: (context, state) {
              if (state is PokemonDetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PokemonDetailError) {
                return Center(
                  child: Text(
                    state.errorMesage,
                  ),
                );
              }
              if (state is PokemonDetailSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      sizedBoxFifteen,
                      _pokemonImageSizedBox(context, state),
                      sizedBoxFifteen,
                      state.model.name == null
                          ? Text(ApplicationConstants.unknownText)
                          : _pokemonName(state, context),
                      sizedBoxFifteen,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: state.model.types != null
                            ? state.model.types!
                                .map(
                                  (type) => _typesCardPadding(context, type),
                                )
                                .toList()
                            : [],
                      ),
                      sizedBoxFifteen,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: state.model.abilities != null
                            ? state.model.abilities!
                                .map(
                                  (ability) =>
                                      _abilitiesCardPadding(context, ability),
                                )
                                .toList()
                            : [],
                      ),
                      sizedBoxFifteen,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.model.stats != null
                              ? state.model.stats!
                                  .map(
                                    (stats) =>
                                        _statsCardPadding(context, stats),
                                  )
                                  .toList()
                              : [],
                        ),
                      ),
                      sizedBoxFifteen,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.model.moves != null
                              ? state.model.moves!
                                  .map(
                                    (moves) =>
                                        _movesCardPadding(context, moves),
                                  )
                                  .toList()
                              : [],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _statsCardPadding(BuildContext context, Stats stats) {
    return Padding(
      padding: ApplicationConstants.normal2xPadding,
      child: Card(
        color: Colors.purple,
        elevation: getMinHeight(context) / 2,
        child: Padding(
            padding: ApplicationConstants.symmetricPadding,
            child: Text(
              stats.stat!.name!,
              style: TextStyle(
                fontSize: getMinWidth(context),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  Padding _typesCardPadding(BuildContext context, Types type) {
    return Padding(
      padding: ApplicationConstants.normal2xPadding,
      child: Card(
        color: Colors.amber,
        elevation: getMinHeight(context) / 2,
        child: Padding(
            padding: ApplicationConstants.symmetricPadding,
            child: Text(
              type.type!.name!,
              style: TextStyle(
                fontSize: getMinWidth(context),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  Padding _abilitiesCardPadding(BuildContext context, Abilities abilities) {
    return Padding(
        padding: ApplicationConstants.normal2xPadding,
        child: Card(
          color: Colors.redAccent,
          elevation: getMinHeight(context) / 2,
          child: Padding(
            padding: ApplicationConstants.symmetricPadding,
            child: Text(
              abilities.ability!.name!,
              style: TextStyle(
                fontSize: getMinWidth(context),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }

  Widget _movesCardPadding(BuildContext context, Moves moves) {
    return Padding(
      padding: ApplicationConstants.normal2xPadding,
      child: Card(
        child: Padding(
          padding: ApplicationConstants.symmetricPadding,
          child: Text(
            moves.move!.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  Text _pokemonName(PokemonDetailSuccess state, BuildContext context) {
    return Text(state.model.name!,
        style: TextStyle(fontSize: getMinHeight(context)));
  }

  SizedBox _pokemonImageSizedBox(
      BuildContext context, PokemonDetailSuccess state) {
    return SizedBox(
      height: getMaxWidth(context),
      child: _pokemonImage(state),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(ApplicationConstants.pokemonDetails),
      leading: InkResponse(
        child: Icon(Icons.arrow_back),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }

  Image _pokemonImage(PokemonDetailSuccess state) {
    return Image.asset(
      'assets/images/pokemon/${state.model.id}.png',
      fit: BoxFit.contain,
    );
  }
}
