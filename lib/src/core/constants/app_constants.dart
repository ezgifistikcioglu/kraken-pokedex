import 'package:flutter/material.dart';

class ApplicationConstants {
  static const String unknownText = 'Unknown';
  static const String loginText = 'Login';
  static const String signUpText = 'Sign-up';
  static const String signOutText = 'Sign Out';
  static const String paswordText = 'Password';
  static const String welcomeText = 'Welcome to Pokedex Application';
  static const String dashboardText = 'Welcome to Pokemon Dashboard';
  static const String welcomeTitle = 'Welcome';
  static const String pokemonPage = 'Go to Pokemon Page';
  static const String pokemonLists = 'Pokemon Lists';
  static const String pokemonDetails = 'Pokemon Details';
  static const String mailTitle = 'Mail';
  static const String emailHintTitle = 'E-Mail';
  static const String emailValidatorText = 'Please enter a valid email address';
  static const String paswordValidatorText =
      'Please enter minimum of 6 characters';
  static const String checkAccountText = "Don't have an account yet?";

  // Padding
  static const EdgeInsets normalPadding = EdgeInsets.all(8);
  static const EdgeInsets normal2xPadding = EdgeInsets.all(18);
  static const EdgeInsets symmetricPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}

// MediaQuery
double getMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.7;

double getMinWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.06;

double getMaxHeight(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.9;

double getMinHeight(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.08;

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

// SizedBox
SizedBox get sizedBoxFive => const SizedBox(height: 5);
SizedBox get sizedBoxTen => const SizedBox(height: 10);
SizedBox get sizedBoxFifteen => const SizedBox(height: 15);

// Color
Color get lightPurple => const Color(0xFF985EA2);
Color get normalPurple => Colors.purple;
