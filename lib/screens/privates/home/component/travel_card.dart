import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';
import 'package:gotripmobile/components/default_button.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({
    Key? key,
    required this.passengers,
    required this.items,
    required this.onChange,
    required this.tripDate,
    required this.tripHour,
    required this.fromPlace,
    required this.toPlace,
    required this.price,
    required this.currency,
    required this.vendorAvatar,
    required this.vendorName,
    required this.placeNumber,
  }) : super(key: key);

  final String passengers;
  final String tripDate;
  final String tripHour;
  final String fromPlace;
  final String toPlace;
  final String price;
  final String currency;
  final String vendorAvatar;
  final String vendorName;
  final int placeNumber;
  final List<String> items;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border(
                top: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey)),
            shape: BoxShape.rectangle),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date de départ'.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      tripDate,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      'Heure : $tripHour',
                      style:
                          const TextStyle(fontSize: 13.0, color: kGotripOrange),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Places disponibles'.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      placeNumber.toString(),
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_up_outlined,
                          color: kGotripBlue400,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            fromPlace,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: kGotripOrange,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            toPlace,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 180,
                  child: DefaultButton(
                    press: () {},
                    text: '$price $currency',
                    height: 50.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        child: Image.asset(
                          vendorAvatar,
                          fit: BoxFit.fill,
                          scale: 3.8,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(vendorName,
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ],
        ));
  }
}
