import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xff2C3333);
const Color primaryColorDark = Color(0xff50577A);
const Color mainTextColor = Colors.white;

class DarkTheme with SubThemeData {
  buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
          bodyColor: mainTextColor,
          displayColor: mainTextColor,
        )
    );
  }
}