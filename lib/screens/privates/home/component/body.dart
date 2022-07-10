// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/screens/privates/booking/booking_screen.dart';
import 'package:gotripmobile/screens/privates/home/component/place_select.dart';
import 'package:gotripmobile/screens/privates/home/component/travel_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String fromPlace = 'Douala';
  String toPlace = 'Yaoundé';
  List<String> cities = [
    "Baffoussamn",
    "Bertoua",
    "Douala",
    "Ebolowa",
    "Kribi",
    "Sangmelima",
    "Yaoundé",
  ];
  List<String> passengerList = ['1', '2', '3', '4', '5'];
  String passengers = '1';
  DateTime selectedDate = DateTime.now();

  void removeItem(String newCity) {
    setState(() {
      cities = List.from(cities)..remove(newCity);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 12),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 20.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => _selectDate(context),
                              child: Row(
                                children: [
                                  const Text(
                                    'Date de départ',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  const Icon(Icons.arrow_drop_down,
                                      color: kGotripOrange),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: const BoxDecoration(
                          color: kGotripSurfaceWhite,
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Column(
                              children: [
                                TripPlaceSelect(
                                  hintText: 'Ville de départ',
                                  place: fromPlace,
                                  items: cities,
                                  onChange: (String? newValue) {
                                    setState(() {
                                      fromPlace = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                TripPlaceSelect(
                                  hintText: 'Ville d\'arrivée',
                                  place: toPlace,
                                  items: cities,
                                  isStart: false,
                                  onChange: (String? newValue) {
                                    setState(() {
                                      toPlace = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kGotripLightOrange50,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.swap_vert,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              )),
          const SizedBox(height: 30),
          SizedBox(
            // height: size.height * 0.5,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: kGotripSurfaceWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      )),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                      height: 40.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for (int i = 6; i < 10; i++)
                            i == 7
                                ? Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: DefaultButton(
                                      press: () {},
                                      text: '0$i : 00',
                                      width: 90,
                                      backgroundColor: kGotripOrange,
                                      textColor: kGotripBackgroundWhite,
                                      // isOutlined: true,
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: DefaultButton(
                                      press: () {},
                                      text: '0$i : 00',
                                      width: 90,
                                      backgroundColor: kGotripBackgroundWhite,
                                      textColor: kGotripOrange,
                                      isOutlined: true,
                                    ),
                                  ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < 5; i++)
                      TravelCard(
                        passengers: passengers,
                        items: passengerList,
                        tripDate: '18/07/2022',
                        tripHour: '08 : 00',
                        fromPlace: 'Douala',
                        toPlace: 'Yaoundé',
                        price: '3000',
                        currency: 'FCFA',
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookingScreen()));
                        },
                        vendorAvatar: 'assets/1024.png',
                        vendorName: 'Ongola Voyage Express',
                        placeNumber: 46,
                        onChange: (String? newValue) {
                          setState(() {
                            passengers = newValue!;
                          });
                        },
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
