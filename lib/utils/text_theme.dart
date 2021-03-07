import 'package:flutter/material.dart';

class CustomTextTheme {
  TextTheme get customTextTheme => TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed,
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        bodyText2: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      );
}
