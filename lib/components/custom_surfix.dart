import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSurffix extends StatelessWidget {
  const CustomSurffix({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        child: SvgPicture.asset(
          svgIcon,
          height: 18.0,
        ));
  }
}
