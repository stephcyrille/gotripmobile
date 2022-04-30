import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/custom_header_auth.dart';
import 'package:gotripmobile/screens/auth/forgot_password/components/body.dart';
import 'package:gotripmobile/screens/auth/signin/signin_screen.dart';

class ForgotPassWordScreen extends StatelessWidget {
  static String routeName = 'forgot_password';

  const ForgotPassWordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: kGotripLightOrange50,
          ),
          CustomHeader(
            text: 'Mot de passe oublié',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SigninPage()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: kGotripBackgroundWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 60),
                    Body(),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
