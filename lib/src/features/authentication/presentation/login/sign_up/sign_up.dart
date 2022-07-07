import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/home/home_view.dart';

import 'package:kraken_pokedex/src/features/authentication/presentation/login/login_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ApplicationConstants.signUpText),
      ),
      body: BlocConsumer<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          _userAuthenticated(state, context);
          _userAuthenticationError(state, context);
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            return Center(
              child: Padding(
                padding: ApplicationConstants.normal2xPadding,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxFifteen,
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value != null &&
                                          !EmailValidator.validate(value)
                                      ? 'Enter a valid email'
                                      : null;
                                },
                              ),
                              sizedBoxTen,
                              TextFormField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: ApplicationConstants.paswordText,
                                  border: OutlineInputBorder(),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value != null && value.length < 6
                                      ? 'Enter min. 6 characters'
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _createAccountWithEmailAndPassword(context);
                                  },
                                  child: const Text('Sign Up'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Text('Already have an account?'),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: const Text('Sign In'),
                      ),
                      const Text('Or'),
                      IconButton(
                        onPressed: () {
                          _authenticateWithGoogle(context);
                        },
                        icon: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _userAuthenticationError(
      AuthenticationState state, BuildContext context) {
    if (state is AuthenticationError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.error)));
    }
  }

  void _userAuthenticated(AuthenticationState state, BuildContext context) {
    if (state is Authenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    }
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _passwordController.text,
        ),
      );
    }
  }

  void _authenticateWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleLoginRequested(),
    );
  }
}
