import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'colors.dart';
import 'pages/home.dart';
import 'widgets/introduction_pages.dart';

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
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {},
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ),
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
      theme: _kFlaceTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/home') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {},
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kFlaceTheme = _buildFlaceTheme();

ThemeData _buildFlaceTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
        primary: kFlaceGreen100,
        onPrimary: kFlaceDark900,
        secondary: kFlaceDark900,
        error: kFlaceErrorRed),
    textTheme: _buildFlaceTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kFlaceGreen100,
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //     focusedBorder: CutCornersBorder(
    //         borderSide: BorderSide(
    //       width: 2.0,
    //       color: kFlaceDark900,
    //     )),
    //     border: CutCornersBorder()
    // )
  );
}

TextTheme _buildFlaceTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kFlaceDark900,
        bodyColor: kFlaceDark900,
      );
}
