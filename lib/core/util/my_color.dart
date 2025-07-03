import 'package:flutter/material.dart';

abstract class MyColor {
  static const logBackColor = Color(0xFF060C22);
  static const logGradient1Color = Color(0xFF6502FE);
  static const logGradient2Color = Color(0xFFE71B6A);

  static const homeText1Color = Color(0xFFF0F4FD);
  static const homeText2Color = Color(0xFFFFFFFF);
  static const homeBodyColor = Color.fromARGB(255, 225, 235, 252);
  static const homeBodySecondaryColor = Color(0xFFF0F4FD);

  static const loginGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [logGradient1Color, logGradient2Color],
  );

  static const inActiveColor = Color(0xFFD6D6D6);
  static const ashhLight = Color(0xFFECF6FF);
  static const bluePrimary = Color(0xFF01204E);
  static const skyPrimary = Color(0xFF30BCED);
  static const skySecondary = Color(0xFFBDDDFC);
  static const textColor = Color(0xFF2D2C2D);
  static const textSecondary = Color(0xFFF9F9F9);
  static const textThird = Color(0xFF757575); //Colors.grey  ;
  static const cardBackgroundColor = Color(0xFFFAFAFA);

  static const primaryColor = Colors.deepOrange;
  static const accentColor = Colors.orange;
  static const bodyHintBoxColor = Color(0xFFE3F2FD);


  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFEEEEEE);
  static const cardDark = Color(0xFF303334);
}
