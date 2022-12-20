import 'package:cached_network_image/cached_network_image.dart';
import '../../config/themes/ui_parameters.dart';
import '../../controller/news_page_controller.dart';
import '../../models/news_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsCard extends GetView<NewsPageController> {
  const NewsCard({Key? key, required this.model}) : super(key: key);

  final NewsPageModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToNewsPage(news: model, tryAgain: false);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: [
            Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ColoredBox(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        child: SizedBox(
                          height: Get.width * 0.25,
                          width: Get.width * 0.35,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            imageUrl: model.image!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('asset/images/logo.png'),
                          ),
                        ),
                      )),
                  const SizedBox(height: 30, width: 20),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                            model.title!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Row(
                            // Untuk Icon dibawah judul dan text
                              children: const []),
                        ]),
                  )
                ])
          ]),
        ),
      ),
    );
  }
}
