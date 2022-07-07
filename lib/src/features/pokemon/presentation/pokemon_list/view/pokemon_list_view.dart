import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/login_view.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_detail/view/pokemon_detail_page.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_list/bloc/pokemon_list_bloc.dart';

class PokemonListViewScreen extends StatefulWidget {
  const PokemonListViewScreen({super.key});

  @override
  State<PokemonListViewScreen> createState() => _PokemonListViewScreenState();
}

class _PokemonListViewScreenState extends State<PokemonListViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PokemonListBloc()..add(PokemonFetched()),
      child: Scaffold(
        appBar: AppBar(
          actions: [_appBarIcon(context)],
          title: const Text(ApplicationConstants.pokemonLists),
        ),
        body: _blocControls(),
      ),
    );
  }

  Widget _appBarIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(builder: (context) => const LoginView()),
        );
      },
      icon: const Icon(Icons.home_outlined),
    );
  }

  BlocBuilder<PokemonListBloc, PokemonListState> _blocControls() {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        if (state is PokemonLoadingState) {
          return const Center(
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
    );
  }

  GridView _contentGridView(PokemonSuccessState state) {
    return GridView.builder(
      gridDelegate: _sliverGridDelegate(),
      itemCount: state.resultList?.length,
      itemBuilder: (context, index) {
        return _goToDetailPokemon(context, state, index);
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _sliverGridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    );
  }

  GestureDetector _goToDetailPokemon(
      BuildContext context, PokemonSuccessState state, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => PokemonDetailPage(
              url: state.resultList![index].url!,
            ),
          ),
        );
      },
      child: _pokemonCard(state, index),
    );
  }

  Widget _pokemonCard(PokemonSuccessState state, int index) {
    return Card(
      child: GridTile(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_pokemonImage(state, index), _pokemonName(state, index)],
        ),
      ),
    );
  }

  Widget _pokemonName(PokemonSuccessState state, int index) {
    return Text(
      state.resultList![index].name ?? ApplicationConstants.unknownText,
    );
  }

  Widget _pokemonImage(PokemonSuccessState state, int index) {
    final url = state.resultList![index].url;
    final id = url!.split('/')[6];
    return Image.asset(
      'assets/images/pokemon/$id.png',
    );
  }
}
