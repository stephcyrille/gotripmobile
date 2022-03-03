import 'package:flace/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        color: kFlaceGreen400,
      ),
    );
  }
}
