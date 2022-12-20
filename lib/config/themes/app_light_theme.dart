import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xff38E54D);
const Color primaryColorLight = Color(0xff95cd41);
const Color primaryColorLightBold = Color(0xff74d803);
const Color mainTextColor = Colors.white;
const Color cardColor = Color.fromARGB(255, 254, 254, 255);


class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryLightColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextTheme().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor,
        ));
  }
}
