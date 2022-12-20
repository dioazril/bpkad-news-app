import 'package:bpkad_news_app/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

import '../config/themes/app_colors.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({Key? key, this.addPadding = true, required this.child}) : super(key: key);

  final bool addPadding;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context)
        ),
        padding: addPadding ? EdgeInsets.only(
          top: mobileScreenPadding,
          left: mobileScreenPadding,
          right: mobileScreenPadding
        ) : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
