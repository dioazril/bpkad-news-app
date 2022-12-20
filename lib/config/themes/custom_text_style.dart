import 'package:bpkad_news_app/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle cartTitles(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Colors.black87,
    fontSize: 20,
    fontWeight: FontWeight.bold);

const detailText = TextStyle(fontSize: 15);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
