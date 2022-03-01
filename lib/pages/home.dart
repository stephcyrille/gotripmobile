import 'package:avatar_glow/avatar_glow.dart';
import 'package:flace/animations/BouncyPageRoute.dart';
import 'package:flace/flace_styles.dart';
import 'package:flace/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flace/animations/delayed_animation.dart';
import 'package:flace/colors.dart';
import 'auth/registration.dart';
import 'auth/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color = kFlaceSurfaceWhite;
    _scale = 1 - _controller.value;

    return Scaffold(
      backgroundColor: kFlaceGreen400,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 50.0),
            DelayedAnimation(
                child: AvatarGlow(
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
                delay: delayedAmount + 1500),
            DelayedAnimation(
              child: const Text(
                "Bienvenue dans FLACE",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 35.0, color: color),
              ),
              delay: delayedAmount + 2000,
            ),
            const SizedBox(
              height: 30.0,
            ),
            DelayedAnimation(
              child: const Text(
                "Redonnez une seconde vie",
                style: TextStyle(fontSize: 20.0, color: color),
              ),
              delay: delayedAmount + 3000,
            ),
            DelayedAnimation(
              child: const Text(
                "à vos vêtements",
                style: TextStyle(fontSize: 20.0, color: color),
              ),
              delay: delayedAmount + 3000,
            ),
            const SizedBox(
              height: 100.0,
            ),
            DelayedAnimation(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: const SignUpPage()));
                },
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButtonUI,
                ),
              ),
              delay: delayedAmount + 4000,
            ),
            const SizedBox(
              height: 20.0,
            ),
            // DelayedAnimation(
            //   child: SingnInButton(
            //     onTap: () {
            //       Navigator.push(
            //           context, BouncyPageRoute(widget: const SigninPage()));
            //     },
            //     text: 'J\'ai deja un compte',
            //     boxColor: Colors.yellow,
            //     boxStyle: KTextStyle.authButtonTextStyle,
            //   ),
            //   delay: delayedAmount + 5000,
            // ),
          ],
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        // margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            'S\'inscrire',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kFlaceGreen400),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
