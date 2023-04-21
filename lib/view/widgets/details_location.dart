import 'package:flutter/material.dart';
import 'package:weather_app/controller/constants/constants.dart';

class DetailsLocation extends StatelessWidget {
  const DetailsLocation({
    super.key,
    required this.leftheadText,
    required this.leftsubText,
    required this.rightheadText,
    required this.rightsubText,
  });

  final String leftheadText;
  final String leftsubText;
  final String rightheadText;
  final String rightsubText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              leftheadText,
              style: listHeadText,
            ),
            sizedBox5,
            Text(
              leftsubText,
              style: listSubText,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              rightheadText,
              style: listHeadText,
            ),
            sizedBox5,
            Text(
              rightsubText,
              style: listSubText,
            ),
          ],
        ),
      ],
    );
  }
}
