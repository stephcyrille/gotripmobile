import 'package:flace/flace_styles.dart';
import 'package:flutter/material.dart';
import 'package:flace/pages/home.dart';
import 'package:flace/colors.dart';
import 'package:flace/widgets/custom_header_auth.dart';
import 'package:flace/widgets/custom_form_field.dart';
import 'package:flace/widgets/custom_rich_text.dart';
import 'package:flace/widgets/custom_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _usenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = kFlaceGreen50;
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
            color: kFlaceGreen300,
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
                  color: kFlaceBackgroundWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: const Material(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: kFlaceBackgroundWhite,
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: kFlaceGreen300,
                            size: 100,
                          ),
                          radius: 50.0,
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Mot de passe oublié?",
                            style: TextStyle(
                                color: kFlaceGreen300.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    onTap: () {},
                    text: 'SE CONNECTER',
                    boxColor: kFlaceGreen400,
                    boxStyle: KTextStyle.authButtonTextStyle,
                  ),
                  const SizedBox(height: 30),
                  const Center(
                      child: Text(
                    'Ou',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )),
                  const SizedBox(height: 10),
                  AuthCustomButton(
                      onTap: () {},
                      text: 'Se connecter avec google',
                      boxColor: Colors.red,
                      boxStyle: KTextStyle.authGoogleButtonTextStyle,
                      boxIcon: Icons.apple_outlined),
                  const SizedBox(height: 20),
                  AuthCustomButton(
                    onTap: () {},
                    text: 'Se connecter via Facebook',
                    boxColor: Colors.blue,
                    boxStyle: KTextStyle.authFacebookButtonTextStyle,
                    boxIcon: Icons.facebook_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
