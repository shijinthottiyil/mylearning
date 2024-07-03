import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppPopups {
  static void errorSnackbar({required String title, required String message}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.redAccent,
    );
  }

  static void infoSnackbar({required String title, required String message}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
    );
  }

  static void successSnackbar(
      {required String title,
      required String message,
      Duration? duration = const Duration(seconds: 3)}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      padding: EdgeInsets.symmetric(horizontal: 16),
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      shouldIconPulse: false,
      duration: duration,
      backgroundColor: const Color.fromARGB(255, 52, 213, 57),
      margin: EdgeInsets.all(16),
      borderColor: Colors.green,
      borderWidth: 2,
      colorText: Colors.white,
    );
  }

  // Loader
}
