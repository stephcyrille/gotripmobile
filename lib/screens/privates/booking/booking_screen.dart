import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/screens/privates/home/home_screen.dart';
import 'package:gotripmobile/screens/privates/booking/components/body.dart';

class BookingScreen extends StatelessWidget {
  static String routeName = '/bookingForm';
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: kGotripOrange400,
            title: const Text(
              'Réservation',
              style: TextStyle(color: kGotripBackgroundWhite),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: IconButton(
                icon: SvgPicture.asset('assets/svg/left-arrow.svg'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
              ),
            )),
        backgroundColor: kGotripLightOrange50,
        body: const Body());
  }
}
