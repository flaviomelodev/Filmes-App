import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: const Color(0xFF139893),
  backgroundColor: const Color(0xFF252525),
  fontFamily: 'Roboto',
  primaryTextTheme: const TextTheme(
    bodyText1: TextStyle(color: Color(0xFF139893), fontSize: 22),
    bodyText2: TextStyle(color: Colors.white, fontSize: 18),
    subtitle1: TextStyle(color: Colors.white, fontSize: 22),
    subtitle2: TextStyle(color: Color(0xFF139893), fontSize: 16),
  ),
);
