import 'package:gotripmobile/screens/greeting/greeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:gotripmobile/screens/auth/signin/signin_screen.dart';
import 'package:gotripmobile/routes.dart';
import 'package:gotripmobile/theme.dart';

class GotripApp extends StatefulWidget {
  const GotripApp({Key? key}) : super(key: key);

  @override
  _GotripAppState createState() => _GotripAppState();
}

class _GotripAppState extends State<GotripApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoTrip',
      initialRoute: GreetingScreen.routeName,
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
