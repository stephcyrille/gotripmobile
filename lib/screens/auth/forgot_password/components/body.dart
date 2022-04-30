import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/custom_surfix.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/components/form_error.dart';
import 'package:gotripmobile/components/no_account_text.dart';
import 'package:gotripmobile/form_error_validator.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: const [
          SizedBox(height: 10),
          Text(
            "Mot de passe oublié",
            style: TextStyle(
                fontSize: 28,
                color: kGotripDark900,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Veuillez saisir votre adresse email, nous allons vous \nenvoyer un lien pour accéder à votre compte",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 70),
          ForgotPassForm(),
        ]),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
          ),
          const SizedBox(height: 20),
          FormError(errors: errors),
          const SizedBox(height: 30),
          DefaultButton(
              press: () {
                if (_formKey.currentState!.validate()) {
                  // Do what we wante
                }
              },
              text: 'Soumettre'),
          const SizedBox(height: 50),
          const NoAccountText(),
        ],
      ),
    );
  }
}
