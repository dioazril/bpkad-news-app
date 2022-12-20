import 'package:bpkad_news_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/themes/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text('Berbagai informasi seputar BPKAD',
                  style: TextStyle(
                      color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            MainButton(
                onTap: () {
                  controller.signInWithGoogle();
                },
                child: Stack(children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset(
                          'assets/images/icons8-google-144.svg')),
                  // const SizedBox(width: 10),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 45,
                    child: Center(
                      child: Text('Masuk Dengan Google',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
