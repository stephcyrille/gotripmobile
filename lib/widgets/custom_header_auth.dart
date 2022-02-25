import 'package:flutter/material.dart';
import 'package:flace/colors.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CustomHeader({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kFlaceGreen50,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(
                color: kFlaceSurfaceWhite,
                fontSize: 20.0,
                fontWeight: FontWeight.w300),
            // style: KTextStyle.headerTextStyle,
          )
        ],
      ),
    );
  }
}
