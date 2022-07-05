import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/login_view.dart';

abstract class LoginViewModel extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void authenticateWithEmailAndPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(controllerEmail.text, controllerPassword.text),
      );
    }
  }

  void authenticateWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  void authenticateWithFacebook(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      FacebookSignInRequested(),
    );
  }
}
