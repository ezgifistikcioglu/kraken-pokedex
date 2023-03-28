import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/login_view.dart';
import 'package:kraken_pokedex/src/features/pokemon/presentation/pokemon_list/view/pokemon_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(ApplicationConstants.dashboardText),
      ),
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          _userNotAuthenticated(state, context);
        },
        child: _userInfos(user, context),
      ),
    );
  }

  Center _userInfos(User user, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.email ?? '',
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          sizedBoxFive,
          if (user.photoURL != null)
            Image.network('${user.photoURL}')
          else
            sizedBoxFive,
          if (user.displayName != null) Text('${user.displayName}'),
          sizedBoxFifteen,
          _goToPageElevatedButton(
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const PokemonListViewScreen(),
                ),
              );
            },
            ApplicationConstants.pokemonPage,
          ),
          sizedBoxFive,
          _goToPageElevatedButton(
            context,
            () {
              context.read<AuthBloc>().add(LogOutRequested());
            },
            ApplicationConstants.signOutText,
          ),
        ],
      ),
    );
  }

  Widget _goToPageElevatedButton(
    BuildContext context,
    VoidCallback? onPressed,
    String data,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      child: Text(data),
    );
  }

  void _userNotAuthenticated(AuthenticationState state, BuildContext context) {
    if (state is UnAuthenticated) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<dynamic>(builder: (context) => const LoginView()),
        (route) => false,
      );
    }
  }
}
