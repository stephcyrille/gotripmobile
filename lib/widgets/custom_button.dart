import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color boxColor;
  final TextStyle boxStyle;

  const DefaultButton(
      {Key? key,
      required this.onTap,
      required this.boxColor,
      required this.boxStyle,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          color: boxColor,
          onPressed: onTap,
          child: Text(
            text,
            style: boxStyle,
          ),
        ));
  }
}
