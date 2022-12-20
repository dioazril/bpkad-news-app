import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/themes/app_colors.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static questionStartDialogue({required VoidCallback onTap}) {

    return  AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Halo',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),

            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('Mohon masuk sebelum membaca berita',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500)),
            )
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: mainGradient(),
            ),
            child: TextButton(
                onPressed: onTap,
                child:
                const Text('Konfirmasi', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700))),
          )
        ]);
  }

  static signOutDialogue({required VoidCallback onTap}) {

    return  AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Apakah Anda Yakin Ingin Keluar?',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87)),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: mainGradient(),
            ),
            child: TextButton(
                onPressed: onTap,
                child:
                const Text('Iya', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700))),
          ),
          const SizedBox(width: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: mainGradient(),
            ),
            child: TextButton(
                onPressed:() => Get.back(),
                child:
                const Text('Tidak', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700))),
          ),
        ]);
  }
}
