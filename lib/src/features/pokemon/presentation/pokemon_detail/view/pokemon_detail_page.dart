import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_detail/bloc/pokemon_detail_bloc.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key, required this.url});
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
                return const Center(
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
                      _pokemonImageSizedBox(context, state),
                      sizedBoxFifteen,
                      if (state.model.name == null)
                        const Text(ApplicationConstants.unknownText)
                      else
                        _pokemonName(state, context),
                      sizedBoxFifteen,
                      _singleChildScrool(
                        state,
                        context,
                        _pokemonTypes(state, context),
                      ),
                      sizedBoxFifteen,
                      _singleChildScrool(
                        state,
                        context,
                        _pokemonAbilities(state, context),
                      ),
                      sizedBoxFifteen,
                      _singleChildScrool(
                        state,
                        context,
                        _pokemonStats(state, context),
                      ),
                      sizedBoxFive,
                      _singleChildScrool(
                        state,
                        context,
                        _pokemonMoves(state, context),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _pokemonMoves(PokemonDetailSuccess state, BuildContext context) {
    return Row(
      children: state.model.moves != null
          ? state.model.moves!
              .map(
                (moves) => _dynamicCardPadding(
                  context,
                  moves.move!.name!,
                  Colors.green,
                  ApplicationConstants.normalPadding,
                ),
              )
              .toList()
          : [],
    );
  }

  Widget _pokemonStats(PokemonDetailSuccess state, BuildContext context) {
    return Row(
      children: state.model.stats != null
          ? state.model.stats!
              .map(
                (stats) => _dynamicCardPadding(
                  context,
                  stats.stat!.name!,
                  Colors.purple,
                  ApplicationConstants.symmetricPadding,
                ),
              )
              .toList()
          : [],
    );
  }

  Widget _pokemonAbilities(PokemonDetailSuccess state, BuildContext context) {
    return Row(
      children: state.model.abilities != null
          ? state.model.abilities!
              .map(
                (abilities) => _dynamicCardPadding(
                  context,
                  abilities.ability!.name!,
                  Colors.redAccent,
                  ApplicationConstants.symmetricPadding,
                ),
              )
              .toList()
          : [],
    );
  }

  Widget _singleChildScrool(
    PokemonDetailSuccess state,
    BuildContext context,
    Widget widget,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: widget,
    );
  }

  Widget _pokemonTypes(PokemonDetailSuccess state, BuildContext context) {
    return Row(
      children: state.model.types != null
          ? state.model.types!
              .map(
                (types) => _dynamicCardPadding(
                  context,
                  types.type!.name!,
                  Colors.amber,
                  ApplicationConstants.symmetricPadding,
                ),
              )
              .toList()
          : [],
    );
  }

  Padding _dynamicCardPadding(
    BuildContext context,
    String details,
    Color color,
    EdgeInsetsGeometry padding,
  ) {
    return Padding(
      padding: ApplicationConstants.normal2xPadding,
      child: Card(
        color: color,
        elevation: getMinHeight(context) / 2,
        child: Padding(
          padding: padding,
          child: Text(
            details,
            style: TextStyle(
              fontSize: getMinWidth(context),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Text _pokemonName(PokemonDetailSuccess state, BuildContext context) {
    return Text(
      state.model.name!,
      style: TextStyle(fontSize: getMinHeight(context)),
    );
  }

  SizedBox _pokemonImageSizedBox(
    BuildContext context,
    PokemonDetailSuccess state,
  ) {
    return SizedBox(
      height: getMaxWidth(context),
      child: _pokemonImage(state),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(ApplicationConstants.pokemonDetails),
      leading: InkResponse(
        child: const Icon(Icons.arrow_back),
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
