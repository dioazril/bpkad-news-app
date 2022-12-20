import '../controller/auth_controller.dart';
import 'package:get/get.dart';
import '../controller/news_page_controller.dart';
import '../controller/theme_controller.dart';
import '../controller/zoom_drawer_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(NewsPageController());
    Get.put(MyDrawerController());
  }
}
