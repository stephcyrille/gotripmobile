import 'package:flace/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])));
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/error.svg',
          height: 16.0,
          width: 16.0,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          error,
          style: const TextStyle(color: kFlaceDark900),
        )
      ],
    );
  }
}
