import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart' as Chopper;
import 'package:kraken_pokedex/src/features/pokemon/data/service/api_service.dart';
import 'package:kraken_pokedex/src/features/pokemon/domain/models/pokemon_model.dart';

class PokemonListViewScreen extends StatefulWidget {
  const PokemonListViewScreen({super.key});

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

  void _getPostsAndReloadScreen() async {
    this.postList = await getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: buildPostList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPostsAndReloadScreen,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 1
  Future<List<PokemonModel>> getPosts() async {
    // 2
    final postResponse = await service.getPosts();

    // 3
    if (postResponse.isSuccessful) {
      // 4
      final postObjectList = postResponse.body as List;
      // 5
      final posts = postObjectList
          .map((singleJsonObject) => PokemonModel.fromJson(singleJsonObject))
          .toList();
      return posts;
    } else {
      // 6
      return <PokemonModel>[];
    }
  }

  Widget buildPostList() {
    if (this.postList.isEmpty) {
      return Container(
        child: Center(
          child: Text("no items in list"),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text(postList[index].name),
                  subtitle: Text(postList[index].xDescription),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              );
            }),
      );
    }
  }
}
