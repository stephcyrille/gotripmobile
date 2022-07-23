import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/default_button.dart';
import 'package:gotripmobile/models/trip_type.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> passengerList = ['1', '2', '3', '4', '5'];
  String passengers = '1';
  List<TripType> tripTypeList = [];

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

    setState(() {
      tripTypeList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
          color: kGotripSurfaceWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: const [
                Text('Réservez le ticket de votre ',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                Text(
                  'prochain(s) voyage',
                  style: TextStyle(color: kGotripOrange400, fontSize: 24.0),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (int i = 0; i < tripTypeList.length; i++)
                      DefaultButton(
                        press: () => _setToggleTripType(tripTypeList[i]),
                        text: tripTypeList[i].name,
                        width: 150,
                        height: 50.0,
                        backgroundColor: tripTypeList[i].isActive
                            ? kGotripLightOrange50
                            : kGotripBackgroundWhite,
                        textColor: tripTypeList[i].isActive
                            ? kGotripDark900
                            : kGotripOrange400,
                      ),
                  ]),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'YDE',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Yaoundé',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'DLA',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Douala',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Date et heure',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '26.05.2021 (14h30)',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Catégorie',
                      style: TextStyle(fontSize: 16.0),
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
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Prix',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '3500 FCFA',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Passager(s)',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                        width: 100.0,
                        child: DropdownButton(
                            hint: const Text('Nombre de passager(s)'),
                            dropdownColor: kGotripBackgroundWhite,
                            focusColor: kGotripOrange,
                            isExpanded: true,
                            items: passengerList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                passengers = newValue!;
                              });
                            },
                            value: passengers,
                            icon: const Visibility(
                                visible: true,
                                child: Icon(Icons.arrow_drop_down)),
                            elevation: 4,
                            style: const TextStyle(
                                color: kGotripDark900, fontSize: 15))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            const Spacer(
              flex: 2,
            ),
            DefaultButton(press: () {}, text: 'Procéder au paiement'),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    ));
  }
}
