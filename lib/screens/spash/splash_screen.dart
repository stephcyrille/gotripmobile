import 'package:avatar_glow/avatar_glow.dart';
import 'package:gotripmobile/animations/bouncy_page_route.dart';
import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/screens/auth/signin/signin.dart';

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
      backgroundColor: kGotripBlue400,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 35.0),
              Column(
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 90,
                    duration: const Duration(seconds: 4),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: const Duration(seconds: 2),
                    startDelay: const Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Image.asset('assets/icon_min.png'),
                          radius: 60.0,
                        )),
                  ),
                  const Text(
                    "Bienvenue dans Gotrip",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Text(
                      "Voyagez désormais sereinement et à l'heure qui vous convient. Vous n'avez qu'a Cliquer et on se charge du reste",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
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
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'S\'inscrire'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: kGotripBlue400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      height: 58.0,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              BouncyPageRoute(widget: const SigninPage()));
                        },
                        child: Text(
                          'J\'ai deja un compte'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: kGotripOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        // color: kGotripOrange,
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
