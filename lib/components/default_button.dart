import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.press,
    required this.text,
    this.height = 60.0,
    this.backgroundColor = kGotripOrange400,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.isOutlined = false,
  }) : super(key: key);

  final VoidCallback press;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          side: isOutlined == true
              ? const BorderSide(
                  color: kGotripOrange, width: 1, style: BorderStyle.solid)
              : null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
