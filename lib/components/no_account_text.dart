import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/screens/auth/signup/signup_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vous n'avez pas de compte ? ",
            style: TextStyle(fontSize: 16)),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, SignupScreen.routeName);
          },
          child: const Text("S'inscrire",
              style: TextStyle(fontSize: 16, color: kGotripOrange400)),
        )
      ],
    );
  }
}
