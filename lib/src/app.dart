import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/authentication/data/repository/auth_repository.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/home/home_view.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_list/view/pokemon_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: normalPurple,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(200, 20),
                ),
              ),
            ),
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeView();
              }
              return const PokemonListViewScreen();
            },
          ),
        ),
      ),
    );
  }
}
