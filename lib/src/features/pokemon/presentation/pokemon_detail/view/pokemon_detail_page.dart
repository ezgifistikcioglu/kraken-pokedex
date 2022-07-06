import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        appBar: AppBar(
          title: Text('Pokedex'),
          leading: InkResponse(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
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
                    state.mesage,
                  ),
                );
              }
              if (state is PokemonDetailSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        height: 280,
                        child: Image.asset(
                          'assets/images/pokemon/${state.model.id}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(state.model.name!, style: TextStyle(fontSize: 30)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: state.model.types!
                            .map(
                              (type) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  color: Colors.amber,
                                  elevation: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      type.type!.name!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
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
}
