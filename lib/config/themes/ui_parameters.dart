import 'package:flutter/material.dart';
import 'package:get/get.dart';

double _mobileScreenPadding = 25.0;
double _cardBorderRadius = 10.0;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);

  static EdgeInsets get mobileScreenPadding =>
      EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
