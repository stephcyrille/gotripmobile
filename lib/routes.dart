import 'package:flutter/material.dart';
import 'package:gotripmobile/screens/auth/signin/signin.dart';
import 'package:gotripmobile/screens/greeting/greeting_screen.dart';

final Map<String, WidgetBuilder> routes = {
  GreetingScreen.routeName: (context) => const GreetingScreen(),
  SigninPage.routeName: (context) => const SigninPage()
};
