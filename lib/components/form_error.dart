import 'package:gotripmobile/colors.dart';
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

  Padding formErrorText({required String error}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
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
            style: const TextStyle(color: kGotripDark900),
          )
        ],
      ),
    );
  }
}
