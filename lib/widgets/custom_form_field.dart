import 'package:flutter/material.dart';
import 'package:flace/colors.dart';
import 'package:flace/flace_styles.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;

  const CustomFormField(
      {Key? key,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          // child: Text(
          //   headingText,
          //   style: KTextStyle.textFieldHeading,
          // ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              decoration: InputDecoration(
                  labelText: headingText,
                  hintText: hintText,
                  hintStyle: KTextStyle.textFieldHintStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kFlaceGreen400),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kFlaceDark900),
                  ),
                  // border: InputBorder.none
                  fillColor: kFlaceGreen300,
                  suffixIcon: suffixIcon),
            ),
          ),
        )
      ],
    );
  }
}
