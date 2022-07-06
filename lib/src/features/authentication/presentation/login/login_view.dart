import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/core/constants/app_constants.dart';
import 'package:kraken_pokedex/src/core/extensions/image_path_extension.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/home/home_view.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/login_view_model.dart';
import 'package:kraken_pokedex/src/features/authentication/presentation/login/sign_up/sign_up.dart';
import 'package:kraken_pokedex/src/utils/common_widgets/button/text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ApplicationConstants.loginText),
      ),
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          }
          if (state is AuthenticationError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Center(
                child: Padding(
                  padding: ApplicationConstants.normal2xPadding,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      children: [
                        _welcomePokedexText(context),
                        sizedBoxFifteen,
                        Center(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                _emailTextFormField(),
                                sizedBoxFifteen,
                                _passwordTextFormField(),
                                sizedBoxFifteen,
                                _loginButtonSizedBox(context)
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => authenticateWithGoogle(context),
                              icon: ImagePaths.ic_google.toWidget(),
                            ),
                            IconButton(
                              onPressed: () =>
                                  authenticateWithFacebook(context),
                              icon: ImagePaths.ic_facebook
                                  .toWidget(height: getMaxHeight(context)),
                            )
                          ],
                        ),
                        const Text(ApplicationConstants.checkAccountText),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text(ApplicationConstants.signUpText),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  SizedBox _loginButtonSizedBox(BuildContext context) {
    return SizedBox(
      width: getMaxWidth(context),
      child: ElevatedButton(
        onPressed: () {
          authenticateWithEmailAndPassword(context);
        },
        child: const Text(ApplicationConstants.loginText),
      ),
    );
  }

  CustomPasswordTextField _passwordTextFormField() {
    return CustomPasswordTextField(
      controller: controllerPassword,
      hintText: ApplicationConstants.paswordText,
      validator: (value) {
        return value != null && value.length < 6
            ? ApplicationConstants.paswordValidatorText
            : null;
      },
    );
  }

  CustomPasswordTextField _emailTextFormField() {
    return CustomPasswordTextField(
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      autofillHints: const [AutofillHints.email],
      hintText: ApplicationConstants.emailHintTitle,
      suffixIcon: const Icon(Icons.mail_rounded),
      validator: (value) {
        return value != null && !EmailValidator.validate(value)
            ? ApplicationConstants.emailValidatorText
            : null;
      },
    );
  }

  Text _welcomePokedexText(BuildContext context) {
    return Text(
      ApplicationConstants.welcomeText,
      style: TextStyle(
        fontSize: getMinWidth(context),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
