import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/custom_surfix.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/components/form_error.dart';
import 'package:gotripmobile/form_error_validator.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String fullname;
  late String password;
  late String confirmPassword;
  late bool remember = false;
  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      password:
      '';
      confirmPassword:
      '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullnameFormField(),
          const SizedBox(height: 20.0),
          buildEmailFormField(),
          const SizedBox(height: 20.0),
          buildPasswordFormField(),
          const SizedBox(height: 20.0),
          buildPasswordFormConfirmField(),
          const SizedBox(height: 20.0),
          FormError(errors: errors),
          const SizedBox(height: 20.0),
          DefaultButton(
            text: 'S\'inscrire',
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

  TextFormField buildFullnameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => fullname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kFullNameNullError)) {
          setState(() {
            errors.remove(kFullNameNullError);
          });
        } else if (value.length >= 5 && errors.contains(kFullNameShortError)) {
          setState(() {
            errors.remove(kFullNameShortError);
          });
        }
        return;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kFullNameNullError)) {
          setState(() {
            errors.add(kFullNameNullError);
          });
        } else if ((value == null || value.length < 5) &&
            !errors.contains(kFullNameShortError)) {
          setState(() {
            errors.add(kFullNameShortError);
          });
        }
        return null;
      },
      style: const TextStyle(color: kGotripDark900),
      decoration: InputDecoration(
        hintText: 'Saissisez vos nom et prénom',
        labelText: 'Nom et prénom',
        suffixIcon: const CustomSurffix(svgIcon: 'assets/svg/user.svg'),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGotripOrange400),
          borderRadius: BorderRadius.circular(25.0),
        ),
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
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
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
      ),
    );
  }

  TextFormField buildPasswordFormConfirmField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
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
        } else if ((value != null) &&
            (password != null) &&
            (value != password)) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }
        return null;
      },
      style: const TextStyle(color: kGotripDark900),
      decoration: InputDecoration(
        hintText: 'Confirmer le mot de passe',
        labelText: 'Confirmer le mot de passe',
        suffixIcon: const CustomSurffix(svgIcon: 'assets/icons/lock.svg'),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGotripOrange400),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
