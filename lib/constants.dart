import 'package:flutter/material.dart';

TextStyle kTextStyleRoom = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey[900],
    letterSpacing: 1.0);

TextStyle kTextStyleLight = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.0);

TextStyle kTextStyleOptions = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue[900],
    letterSpacing: 1.0);

TextStyle kTextStyleInfo = TextStyle(
    fontSize: 14.0, color: Colors.amber[700], fontWeight: FontWeight.w600);

BoxDecoration kBottomSheetDecoration = BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);

LinearGradient kOrangeGradient = LinearGradient(
    colors: [Color(0xfff19197), Color(0xfff4a68f), Color(0xfff6b28b)]);
LinearGradient kPurpleGradient = LinearGradient(
    colors: [Color(0xffac8ff2), Color(0xffcb8ff3), Color(0xffe08def)]);
LinearGradient kBlueGradient = LinearGradient(
    colors: [Color(0xff7fcdef), Color(0xff7cd6ef), Color(0xff79dded)]);
LinearGradient kGreenGradient = LinearGradient(
    colors: [Color(0xff6ee28c), Color(0xff85e68a), Color(0xffa3ed87)]);
