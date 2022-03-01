import 'package:flutter/material.dart';
import 'package:flace/screens/auth/signin/signin.dart';
import 'package:flace/screens/spash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SigninPage.routeName: (context) => const SigninPage()
};
