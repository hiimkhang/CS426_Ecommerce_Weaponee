import 'package:flutter/material.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 92);
const Color transparentGrey = Color.fromARGB(163, 192, 185, 185);
const Color darkGrey = Color(0xff202020);
const Color galaxyPurple = Color.fromARGB(255, 92, 92, 98);
const Color lightGrey = Color.fromARGB(255, 149, 149, 158);
const Color mediumGrey = Color.fromARGB(255, 49, 48, 50);

const LinearGradient mainButton = LinearGradient(colors: [
  darkGrey,
  darkGrey,
  Color.fromARGB(255, 58, 56, 52),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const LinearGradient lightButton = LinearGradient(colors: [
  lightGrey,
  lightGrey,
  Color.fromARGB(255, 88, 87, 91),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
