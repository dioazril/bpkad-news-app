import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/News-Page/home_page.dart';
import 'auth_controller.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onInit() async {
    user.value = Get.find<AuthController>().getUser();
    super.onInit();
  }

  @override
  void onReady() {
    onInit();
    super.onReady();
  }

  void beranda() {
    Get.offAll(const HomePage());
  }

  void profil() {
    _launch(Uri.parse(
        'http://bpkad.sumutprov.go.id/index.php?mod=single-post&id=288'));
  }

  void bpkad() {
    _launch(Uri.parse(
        'http://bpkad.sumutprov.go.id/index.php?mod=single-post&id=296'));
  }

  void download() {
    _launch(Uri.parse(
        'http://bpkad.sumutprov.go.id/index.php?mod=single-post&id=319'));
  }

  void pengaturan() {}

  void website() {
    _launch(Uri.parse('http://bpkad.sumutprov.go.id/'));
  }



  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().navigateToLoginPage();
  }

  void email() {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'dioazril@gmail.com');
    _launch(emailLaunchUri);
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
