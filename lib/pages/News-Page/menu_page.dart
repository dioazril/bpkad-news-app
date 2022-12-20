import '../../controller/zoom_drawer_controller.dart';
import '../../config/themes/ui_parameters.dart';
import '../../config/themes/app_colors.dart';
import '../Login-Page/login_page_casual.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MyDrawerController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: UIParameters.mobileScreenPadding,
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: onSurfaceTextColor))),
          child: SafeArea(
            child: Stack(children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: ()  {controller.toggleDrawer();},
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => controller.user.value == null
                          ? TextButton.icon(
                          icon: const Icon(Icons.login_rounded),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              elevation: 0,
                              backgroundColor: Colors.green.shade700.withOpacity(0.6)),
                          onPressed: () {
                            // Get.back();
                            Get.toNamed(LoginScreen.routeName);
                          },
                          label: const Text("Sign in"))
                          : Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top: 12, bottom: 10),
                              child: CircleAvatar(
                                foregroundImage:
                                controller.user.value!.photoURL == null
                                    ? null
                                    : NetworkImage(
                                    controller.user.value!.photoURL!),
                                backgroundColor: Colors.white,
                                radius: 30,
                              ),
                            ),
                          )),
                      Obx(
                        () => controller.user.value == null
                            ? const SizedBox()
                            : Text(controller.user.value!.displayName ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: onSurfaceTextColor)),
                      ),
                      Obx(
                        () => controller.user.value == null
                            ? const SizedBox()
                            : Text(controller.user.value!.email ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: onSurfaceTextColor)),
                      ),
                      const Spacer(flex: 1),
                      _DrawerButton(
                          icon: Icons.home,
                          label: 'Beranda',
                          onPressed: () => controller.beranda()),
                      _DrawerButton(
                          icon: Icons.people,
                          label: 'Profil',
                          onPressed: () => controller.profil()),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: _DrawerButton(
                            icon: Icons.apartment,
                            label: 'BPKAD',
                            onPressed: () => controller.bpkad()),
                      ),
                      _DrawerButton(
                          icon: Icons.download,
                          label: 'Download',
                          onPressed: () => controller.download()),
                      _DrawerButton(
                          icon: Icons.settings,
                          label: 'Pengaturan',
                          onPressed: () => controller.pengaturan()),
                      _DrawerButton(
                          icon: Icons.web,
                          label: 'Website',
                          onPressed: () => controller.website()),
                      const Spacer(flex: 2),
                      _DrawerButton(
                          icon: Icons.logout,
                          label: 'Keluar',
                          onPressed: () {
                            controller.signOut();
                          }),
                    ]),
              )
            ]),
          ),
        ));
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
      ),
      label: Text(label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
    );
  }
}
