import 'package:flace/screens/spash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flace/screens/auth/signin/signin.dart';
import 'package:flace/routes.dart';
import 'package:flace/theme.dart';

class FlaceApp extends StatefulWidget {
  const FlaceApp({Key? key}) : super(key: key);

  @override
  _FlaceAppState createState() => _FlaceAppState();
}

class _FlaceAppState extends State<FlaceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flace',
      initialRoute: SplashScreen.routeName,
      routes: routes,
      onGenerateRoute: _getRoute,
      theme: theme(),
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/signin') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const SigninPage(),
      fullscreenDialog: true,
    );
  }
}
