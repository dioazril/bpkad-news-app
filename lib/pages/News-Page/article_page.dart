import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/news_page_controller.dart';

class MyArticlePage extends GetView<NewsPageController> {
  MyArticlePage({Key? key}) : super(key: key);
  static String routeName = '/articlepage';
  final model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title, style: const TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xff55db27),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(model.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                model.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.shade500,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('BPKAD',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  )),
              const SizedBox(height: 50),
              Text(
                model.content,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
