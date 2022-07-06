import 'package:flutter/material.dart';
import 'package:kraken_pokedex/src/core/extensions/result_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/home/home_view.dart';
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
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  icon: Icon(Icons.home_outlined))
            ],
            title: Text('Pokemon Lists'),
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
      itemCount: state.resultList?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonDetailPage(
                          url: state.resultList![index].url!,
                        )));
          },
          child: Card(
            child: GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/pokemon/${state.resultList![index].getId()}.png'),
                  Text(state.resultList![index].name ?? "ww")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
