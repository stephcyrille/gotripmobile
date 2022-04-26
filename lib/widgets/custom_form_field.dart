import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/gotrip_styles.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                    borderSide: BorderSide(color: kGotripBlue400),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kGotripDark900),
                  ),
                  // border: InputBorder.none
                  fillColor: kGotripGreen300,
                  suffixIcon: suffixIcon),
            ),
          ),
        )
      ],
    );
  }
}
