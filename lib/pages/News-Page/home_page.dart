import '../../controller/zoom_drawer_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_page.dart';
import 'menu_page.dart';

class HomePage extends GetView<MyDrawerController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyDrawerController>(builder: (_) {
        return ZoomDrawer(
          controller: _.zoomDrawerController,
          menuScreen:  const MenuPage(),
          mainScreen: const MainPage(),
          borderRadius: 50.0,
          showShadow: true,
          angle: 0.0,
          menuScreenWidth: double.maxFinite,
          moveMenuScreen: false,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white,
          duration: const Duration(milliseconds: 500),
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.easeOutBack,
          slideWidth: MediaQuery.of(context).size.width * 0.8,
        );
      }),
    );
  }
}
