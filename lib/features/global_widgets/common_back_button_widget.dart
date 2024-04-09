import 'package:flutter/material.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';

class CommonBackButtonWidget extends StatelessWidget {
  const CommonBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.circular12,
          border: Border.all(
            color: AppColors.kBorder,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
    );
  }
}
