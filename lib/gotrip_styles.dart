import 'package:flutter/material.dart';

import 'colors.dart';

class KTextStyle {
  static const headerTextStyle = TextStyle(
      color: kGotripDark900, fontSize: 28, fontWeight: FontWeight.w700);

  static const textFieldHeading = TextStyle(
      color: kGotripDarkBlue500, fontSize: 16, fontWeight: FontWeight.w400);

  static const textFieldHintStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    // fontStyle: FontStyle.italic
  );

  static const authButtonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: kGotripBackgroundWhite);

  static const authGoogleButtonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: kGotripBackgroundWhite);

  static const authFacebookButtonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: kGotripBackgroundWhite);
}
