import 'package:flutter/material.dart';
import 'package:mylearning/util/ui/constant/app_border_radius.dart';
import 'package:mylearning/util/ui/constant/app_colors.dart';

class AppPopus {
  AppPopus._();

  // SnackBar to show information.
  static void infoSnackBar(
      {required BuildContext context, required String infoText}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(infoText),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.kBlack,
        shape: BeveledRectangleBorder(borderRadius: AppBorderRadius.circular2),
        elevation: 0,
      ),
    );
  }
}
