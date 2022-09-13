import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/models/trip_type.dart';

enum SelectedTripType { oneTrip, roundTrip }

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> passengerList = ['1', '2', '3', '4', '5'];
  String passengers = '1';
  List<TripType> tripTypeList = [];
  SelectedTripType tripType = SelectedTripType.oneTrip;

  @override
  void initState() {
    super.initState();
    var newList = TripType.getTripTypeServices();
    var index = newList.indexWhere((element) => element.id == 1);
    newList[index].isActive = true;
    setState(() {
      tripTypeList = newList;
    });
  }

  void _setToggleTripType(TripType selected) {
    var newList = TripType.getTripTypeServices();
    var index = newList.indexWhere((element) => element.id == selected.id);
    newList[index].isActive = true;
    if (selected.slug == 'one-trip') {
      setState(() {
        tripType = SelectedTripType.oneTrip;
      });
    } else {
      setState(() {
        tripType = SelectedTripType.roundTrip;
      });
    }
    setState(() {
      tripTypeList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: kGotripOrange400,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            for (int i = 0; i < tripTypeList.length; i++)
                              DefaultButton(
                                press: () =>
                                    _setToggleTripType(tripTypeList[i]),
                                text: tripTypeList[i].name,
                                width: 150,
                                height: 50.0,
                                backgroundColor: tripTypeList[i].isActive
                                    ? kGotripLightOrange50
                                    : kGotripOrange400,
                                textColor: tripTypeList[i].isActive
                                    ? kGotripOrange400
                                    : kGotripBackgroundWhite,
                              ),
                          ]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.hail,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                Icon(
                                  Icons.directions_bus_filled,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            const Text(
                              'YDE',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  color: kGotripBackgroundWhite),
                            ),
                            const Text(
                              'Yaoundé',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Column(children: [
                          Icon(
                            tripType == SelectedTripType.oneTrip
                                ? Icons.arrow_forward
                                : Icons.swap_horiz,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                Icon(
                                  Icons.directions_walk,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            const Text(
                              'DLA',
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  color: kGotripBackgroundWhite),
                            ),
                            const Text(
                              'Douala',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
              color: kGotripSurfaceWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text('28',
                                        style: TextStyle(
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold,
                                            color: kGotripOrange400)),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text('Juillet',
                                          style: TextStyle(fontSize: 14.0))
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text('Vendredi',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Catégorie',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Classique',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Prix',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            '3 500 CFA',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: kGotripOrange400),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Passagers".toUpperCase(),
                                style: const TextStyle(fontSize: 15.0)),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: kGotripDark900,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 60,
                      width: 370,
                      decoration: const BoxDecoration(
                          color: kGotripLightOrange50,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/1024.png"),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Alexandre Manga (vous)',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      // fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.close_rounded),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        child: const Text(
                          'Ajouter un passager',
                          style: TextStyle(
                              fontSize: 16.0, color: kGotripOrange400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: kGotripLightOrange50,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Icon(
                          Icons.add,
                          size: 18.0,
                          color: kGotripDark900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        child: const Text(
                          'Possédez-vous un code promo ?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: kGotripOrange400,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DefaultButton(
                      press: () {},
                      text: 'Procéder au paiement',
                      backgroundColor: kGotripOrange400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
