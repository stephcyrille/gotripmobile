import 'package:flutter/material.dart';
import 'package:gotripmobile/animations/bouncy_page_route.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/screens/auth/signin/signin.dart';
import 'package:gotripmobile/components/default_button.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  final List<Map> splashData = [
    {
      "title": "Détendez vous",
      "subtitle":
          "Voyagez désormais sereinement et à l'heure qui vous convient",
      "image": "assets/images/land_1.jpg"
    },
    {
      "title": "Cliquez et validez",
      "subtitle":
          "Sélectionnez votre trajet et choisissez votre date de départ, nous on se charge du reste",
      "image": "assets/images/land_2.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGotripLightOrange50,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                itemCount: splashData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: kGotripBackgroundWhite,
                              borderRadius: BorderRadius.circular(50)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(60), // Image radius
                              child: Image.asset(
                                'assets/1024.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          splashData[index]['title'].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: kGotripOrange400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          splashData[index]['subtitle'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: kGotripDark900,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(8), // Border width
                      //   decoration: BoxDecoration(
                      //       color: kGotripBackgroundWhite,
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(20),
                      //     child: SizedBox.fromSize(
                      //       size: const Size.fromRadius(100), // Image radius
                      //       child: Image.asset(
                      //         splashData[index]['image'],
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Spacer(),
                    ],
                  );
                },
                onPageChanged: (value) => setState(() => _currentPage = value),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: DefaultButton(
                        text: _currentPage + 1 == splashData.length
                            ? 'Démarrez votre voyage'
                            : 'Continuer',
                        press: () {
                          _currentPage + 1 == splashData.length
                              ? Navigator.push(context,
                                  BouncyPageRoute(widget: const SigninPage()))
                              : _controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color:
            _currentPage == index ? kGotripOrange400 : const Color(0xFFE9E9E9),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }
}

class SpashContent extends StatelessWidget {
  const SpashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "GoTrip",
          style: TextStyle(
            fontSize: 36,
            color: kGotripDarkBlue500,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
