import 'package:flace/colors.dart';
import 'package:flace/components/default_button.dart';
import 'package:flace/components/form_error.dart';
import 'package:flace/form_error_validator.dart';
import 'package:flutter/material.dart';
import 'package:flace/components/custom_surfix.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 20.0),
          buildPasswordFormField(),
          const SizedBox(height: 20.0),
          FormError(errors: errors),
          const SizedBox(height: 20.0),
          Row(
            children: [Checkbox(value: false, onChanged: (value) {})],
          ),
          DefaultButton(
            text: 'Se connecter',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        if ((value == null || value.isNotEmpty) &&
            errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if ((value == null || value.length < 8) &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      style: const TextStyle(color: kFlaceDark900),
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
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value!) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      style: const TextStyle(color: kFlaceDark900),
      decoration: const InputDecoration(
        hintText: 'Saissisez votre email',
        labelText: 'Email',
        suffixIcon: CustomSurffix(svgIcon: 'assets/icons/mail.svg'),
      ),
    );
  }
}
