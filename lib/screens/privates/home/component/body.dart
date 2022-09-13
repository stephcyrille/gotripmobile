// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/models/hours.dart';
import 'package:gotripmobile/screens/privates/booking/booking_screen.dart';
import 'package:gotripmobile/screens/privates/home/component/place_select.dart';
import 'package:gotripmobile/screens/privates/home/component/travel_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime selectedDate = DateTime.now();
  String fromPlace = 'Douala';
  String toPlace = 'Yaoundé';
  bool isActive = true;
  List<String> fromCities = [];
  List<String> toCities = [];
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
  List<Hour> hourList = [];
  late Hour selectedHour;

  @override
  void initState() {
    super.initState();
    var newList = Hour.getHourServices();
    var index = newList.indexWhere((element) => element.id == 6);
    newList[index].isActive = true;
    setState(() {
      fromCities = List.from(cities)..remove(toPlace);
      toCities = List.from(cities)..remove(fromPlace);
      hourList = newList;
    });
  }

  void _setUpdateCities(String newCity, String referential) {
    if (referential == 'from') {
      List<String> newToCities = List.from(cities)..remove(newCity);
      setState(() {
        toCities = newToCities;
      });
    } else if (referential == 'to') {
      List<String> newFromities = List.from(cities)..remove(newCity);
      setState(() {
        fromCities = newFromities;
      });
    }
  }

  void _swapCities() {
    var newFrom = toPlace;
    var newTo = fromPlace;
    // Changing first place list to avoid app crashing about the missing of place in the city list
    setState(() {
      fromCities = List.from(cities)..remove(newTo);
      toCities = List.from(cities)..remove(newFrom);
    });

    setState(() {
      fromPlace = newFrom;
      toPlace = newTo;
    });
  }

  void _setToggleHour(Hour selected) {
    var newList = Hour.getHourServices();
    var index = newList.indexWhere((element) => element.id == selected.id);
    newList[index].isActive = true;

    setState(() {
      hourList = newList;
      selectedHour = selected;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
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
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            // width: MediaQuery.of(context).size.width * 0.75,
                            children: [
                              Row(children: [
                                TripPlaceSelect(
                                  hintText: 'Ville de départ',
                                  place: fromPlace,
                                  items: fromCities,
                                  onChange: (String? newValue) {
                                    setState(() {
                                      fromPlace = newValue!;
                                    });
                                    _setUpdateCities(newValue!, 'from');
                                  },
                                )
                              ]),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  TripPlaceSelect(
                                    hintText: 'Ville d\'arrivée',
                                    place: toPlace,
                                    items: toCities,
                                    isStart: false,
                                    onChange: (String? newValue) {
                                      setState(() {
                                        toPlace = newValue!;
                                      });
                                      _setUpdateCities(newValue!, 'to');
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 15.0),
                                    backgroundColor: kGotripLightOrange50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: () => _swapCities(),
                                  child: const Icon(
                                    Icons.swap_vert,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ])
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
                          for (int i = 0; i < hourList.length; i++)
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5.0),
                                  backgroundColor: hourList[i].isActive
                                      ? kGotripOrange
                                      : kGotripLightOrange50,
                                  primary: hourList[i].isActive
                                      ? kGotripBackgroundWhite
                                      : kGotripOrange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                onPressed: () => _setToggleHour(hourList[i]),
                                child: Text(
                                  hourList[i].value,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: hourList[i].isActive
                                          ? kGotripBackgroundWhite
                                          : kGotripDark900),
                                ),
                              ),
                            )
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
