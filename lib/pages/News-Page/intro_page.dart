import '../../config/icons/app_icons.dart';
import '../../widgets/app_circle_button.dart';
import '../../config/themes/app_colors.dart';
import '../../pages/News-Page/home_page.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(AppIcons.introIcon,
                  size: 65,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black54, blurRadius: 10.0)
                  ]),
              const SizedBox(height: 20),
              Text('Mewujudkan masyarakat Sumatera Utara yang bermartabat dalam kehidupan, politik, pendidikan, pergaulan, dan lingkungan',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 40),
              CircleButton(
                  onTap: () => Get.offAll(const HomePage()),
                  child: const Icon(Icons.arrow_forward, size: 50)),
            ]),
          )),
    );
  }
}
