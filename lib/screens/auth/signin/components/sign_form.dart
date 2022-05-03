import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/custom_surfix.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/components/form_error.dart';
import 'package:gotripmobile/form_error_validator.dart';
import 'package:gotripmobile/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:gotripmobile/screens/privates/home/home_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late bool remember = false;
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
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kGotripOrange400,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              const Text('Se souvenir de moi'),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, ForgotPassWordScreen.routeName);
                },
                child: const Text(
                  'Mot de passe oublié',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 20.0),
          DefaultButton(
            text: 'Se connecter',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
        if ((value.isNotEmpty) && errors.contains(kPassNullError)) {
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
      style: const TextStyle(color: kGotripDark900),
      decoration: InputDecoration(
        hintText: 'Saissisez votre mot de passe',
        labelText: 'Mot de passe',
        suffixIcon: const CustomSurffix(svgIcon: 'assets/icons/lock.svg'),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGotripOrange400),
          borderRadius: BorderRadius.circular(25.0),
        ),
        // labelStyle: const TextStyle(color: kGotripOrange400),
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
      style: const TextStyle(color: kGotripDark900),
      decoration: InputDecoration(
        hintText: 'Saissisez votre email',
        labelText: 'Email',
        suffixIcon: const CustomSurffix(svgIcon: 'assets/icons/mail.svg'),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGotripOrange400),
          borderRadius: BorderRadius.circular(25.0),
        ),
        // labelStyle: const TextStyle(color: kGotripOrange400),
      ),
    );
  }
}
