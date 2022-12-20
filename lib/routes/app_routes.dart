import '../pages/Login-Page/login_page_casual.dart';
import '../controller/zoom_drawer_controller.dart';
import '../controller/news_page_controller.dart';
import '../../pages/News-Page/intro_page.dart';
import '../pages/News-Page/splash_screen.dart';
import '../pages/News-Page/article_page.dart';
import '../pages/News-Page/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/introduction', page: () => const IntroductionPage()),
        GetPage(
            name: '/homepage',
            page: () => const HomePage(),
            binding: BindingsBuilder(() {
              Get.put(NewsPageController());
              Get.put(MyDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: MyArticlePage.routeName,
            page: () =>  MyArticlePage())
      ];
}
