import 'package:avatar_glow/avatar_glow.dart';
import 'package:flace/animations/BouncyPageRoute.dart';
import 'package:flace/flace_styles.dart';
import 'package:flace/size_config.dart';
import 'package:flace/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flace/animations/delayed_animation.dart';
import 'package:flace/colors.dart';
import 'package:flace/screens/auth/signin/signin.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFlaceGreen400,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 35.0),
              Container(
                child: Column(
                  children: <Widget>[
                    AvatarGlow(
                      endRadius: 90,
                      duration: const Duration(seconds: 4),
                      glowColor: Colors.yellow,
                      repeat: true,
                      repeatPauseDuration: const Duration(seconds: 2),
                      startDelay: const Duration(seconds: 1),
                      child: Material(
                          elevation: 8.0,
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Image.asset('assets/icon.png'),
                            radius: 50.0,
                          )),
                    ),
                    const Text(
                      "Bienvenue dans FLACE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Redonnez une seconde vie",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(children: <Widget>[
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 58.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {},
                        child: Text(
                          'S\'inscrire'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: kFlaceGreen400),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      height: 58.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                          Navigator.push(context,
                              BouncyPageRoute(widget: const SigninPage()));
                        },
                        child: Text(
                          'J\'ai deja un compte'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        color: kFlaceYellow,
                      ),
                    ),
                    const Spacer(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
