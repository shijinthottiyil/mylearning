import 'package:flutter/material.dart';

class AppPopups {
  AppPopups._();

  // Loader
  static Future<void> showLoaderDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // Cancel Loader
  static void cancelLoaderDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
