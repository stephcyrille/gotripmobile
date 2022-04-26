import 'package:flutter/material.dart';
import 'package:gotripmobile/pages/home.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/widgets/custom_header_auth.dart';
import 'package:gotripmobile/widgets/custom_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _emailController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: kGotripGreen300,
          ),
          CustomHeader(
            text: 'Accueil',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  CustomFormField(
                    headingText: "Nom d'utilisateur",
                    hintText: "Nom d'utilisateur",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _usenameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    headingText: "Mot de passe",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "Mot de passe",
                    obsecureText: true,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility), onPressed: () {}),
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20.0),
                  // AuthButton(
                  //   onTap: () {},
                  //   text: 'S\'INSCRIRE',
                  //   boxColor: kGotripGreen400,
                  //   boxStyle: KTextStyle.authButtonTextStyle,
                  // ),
                  // const SizedBox(height: 30),
                  // const Center(
                  //     child: Text(
                  //   'Ou',
                  //   style: TextStyle(fontWeight: FontWeight.w400),
                  // )),
                  // const SizedBox(height: 10),
                  // AuthCustomButton(
                  //     onTap: () {},
                  //     text: 'S\'inscrire avec google',
                  //     boxColor: Colors.red,
                  //     boxStyle: KTextStyle.authGoogleButtonTextStyle,
                  //     boxIcon: Icons.apple_outlined),
                  // const SizedBox(height: 20),
                  // AuthCustomButton(
                  //   onTap: () {},
                  //   text: 'S\'inscrire avec Facebook',
                  //   boxColor: Colors.blue,
                  //   boxStyle: KTextStyle.authFacebookButtonTextStyle,
                  //   boxIcon: Icons.facebook_outlined,
                  // ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
