import 'package:gotripmobile/components/social_card.dart';
import 'package:flutter/material.dart';
import 'package:gotripmobile/screens/auth/signup/components/signup_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    'Inscription'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 33,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  // const SizedBox(height: 20.0),
                  // const Text(
                  //   'Connecte toi avec ton adresse email et ton mot de passe ou continuer avec son compte social',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  const SizedBox(height: 40.0),
                  const SignupForm(),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/svg/google.svg",
                        press: () {},
                      ),
                      SocialCard(
                        icon: "assets/svg/facebook.svg",
                        press: () {},
                      ),
                      SocialCard(
                        icon: "assets/svg/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // const NoAccountText()
                ],
              ),
            )));
  }
}
