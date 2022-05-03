import 'package:flutter/material.dart';
import 'package:gotripmobile/colors.dart';

class TripPlaceSelect extends StatelessWidget {
  const TripPlaceSelect({
    Key? key,
    required this.hintText,
    required this.place,
    required this.onChange,
    this.isStart = true,
    required this.items,
  }) : super(key: key);

  final String hintText;
  final String place;
  final List<String> items;
  final bool isStart;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(Icons.trip_origin,
                  color: isStart == true ? kGotripBlue400 : kGotripOrange)),
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              width: MediaQuery.of(context).size.width * 0.6,
              child: DropdownButton(
                hint: Text(hintText),
                dropdownColor: kGotripBackgroundWhite,
                focusColor: kGotripOrange,
                isExpanded: true,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChange,
                value: place,
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                elevation: 4,
                style: const TextStyle(color: kGotripDark900, fontSize: 15),
              )),
        ]),
      ],
    );
  }
}
