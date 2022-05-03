import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          primary: kGotripOrange400,
          onPrimary: kGotripDark900,
          secondary: kGotripOrange,
          error: kGotripErrorRed),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kGotripDark900),
      bodyText2: TextStyle(color: kGotripDark900));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kGotripLightOrange50,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(28),
      gapPadding: 10.0);
  OutlineInputBorder outlineInputBorderFocus = OutlineInputBorder(
      borderSide: const BorderSide(color: kGotripBlue300),
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
