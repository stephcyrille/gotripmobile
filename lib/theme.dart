import 'package:flutter/material.dart';
import 'package:flace/colors.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          primary: kFlaceGreen400,
          onPrimary: kFlaceDark900,
          secondary: kFlaceYellow,
          error: kFlaceErrorRed),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kFlaceDark900),
      bodyText2: TextStyle(color: kFlaceDark900));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kFlaceBackgroundWhite,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: kFlaceBackgroundWhite, fontSize: 18.0),
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(28),
      gapPadding: 10.0);
  OutlineInputBorder outlineInputBorderFocus = OutlineInputBorder(
      borderSide: const BorderSide(color: kFlaceGreen300),
      borderRadius: BorderRadius.circular(28),
      gapPadding: 10.0);
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 42.0, vertical: 20.0),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorderFocus,
    border: outlineInputBorder,
  );
}
