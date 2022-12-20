import 'package:bpkad_news_app/config/themes/app_colors.dart';
import 'package:bpkad_news_app/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_card.dart';
import '../../config/icons/app_icons.dart';
import '../../config/themes/custom_text_style.dart';
import '../../controller/news_page_controller.dart';
import '../../controller/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';

class MainPage extends GetView<MyDrawerController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsPageController newsPageController = Get.find();

    return Container(
      decoration: BoxDecoration(gradient: secondGradient()),
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleButton(
                onTap: controller.toggleDrawer,
                child: const Icon(
                  AppIcons.menuLeft,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  // const Icon(AppIcons.peace),
                  Obx(
                    () => controller.user.value == null
                        ? const Text('Halo',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: onSurfaceTextColor))

                        : Text('Halo ${controller.user.value!.displayName}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: onSurfaceTextColor)),
                  ),
                ]),
              ),
              Text('Dapatkan berita terupdate hanya di aplikasi BPKAD News',
                  style: headerText.copyWith(color: onSurfaceTextColor))
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ContentArea(
                addPadding: false,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                        model: newsPageController.allContent[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: newsPageController.allContent.length,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
