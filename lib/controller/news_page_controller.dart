import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../models/news_page_model.dart';
import '../pages/News-Page/article_page.dart';
import '../references/references.dart';
import 'auth_controller.dart';

class NewsPageController extends GetxController{
  final allContent = <NewsPageModel>[].obs;
  var logger = Logger();

  @override
  void onReady() {
    getAllContent();
    super.onReady();
  }

  Future<void> getAllContent() async{
    try {
      QuerySnapshot<Map<String, dynamic>> data = await newsContents.get();
      final contents = data.docs.map((content) => NewsPageModel.fromSnapshot(content)).toList();
      allContent.assignAll(contents);
    } catch (e){
      logger.i(e);
    }
  }

  void navigateToNewsPage({required NewsPageModel news, bool tryAgain = false}){
    AuthController authController = Get.find();
    if (authController.isLoggedIn()){
      if (tryAgain){
        Get.back();
        // Get.offNamed();
      } else {
        Get.toNamed(MyArticlePage.routeName, arguments: news);
      }
    } else {
      authController.showLoginAlertDialogue();
    }
  }
}