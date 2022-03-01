import 'package:flace/colors.dart';
import 'package:flutter/material.dart';
import 'package:flace/components/custom_surfix.dart';
import 'package:flutter/services.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      'Bon retour',
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Connecte toi avec ton adresse email et ton mot de passe \nou continuer avec son compte social',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    const SignForm()
                  ],
                ))));
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 20.0),
          buildPasswordFormField(),
          const SizedBox(height: 20.0),
          defaultButton(),
        ],
      ),
    );
  }

  SizedBox defaultButton() {
    return SizedBox(
      width: double.infinity,
      height: 58.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {},
        child: const Text(
          'Se connecter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        color: kFlaceGreen400,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Saissisez votre mot de passe',
        labelText: 'Mot de passe',
        suffixIcon: CustomSurffix(svgIcon: 'assets/icons/lock.svg'),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Saissisez votre email',
        labelText: 'Email',
        suffixIcon: CustomSurffix(svgIcon: 'assets/icons/mail.svg'),
      ),
    );
  }
}
