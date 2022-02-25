import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color boxColor;
  final TextStyle boxStyle;

  const AuthButton(
      {Key? key,
      required this.onTap,
      required this.boxColor,
      required this.boxStyle,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: boxStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color boxColor;
  final TextStyle boxStyle;
  final IconData boxIcon;

  const AuthCustomButton(
      {Key? key,
      required this.onTap,
      required this.boxColor,
      required this.boxStyle,
      required this.boxIcon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(boxIcon, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: boxStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
