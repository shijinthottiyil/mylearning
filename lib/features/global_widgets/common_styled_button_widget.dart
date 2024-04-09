import 'package:flutter/material.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class CommonStyledButtonWidget extends StatelessWidget {
  const CommonStyledButtonWidget({
    super.key,
    required this.onTap,
    required this.buttonName,
  });
  final void Function()? onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.kDark,
          borderRadius: AppBorderRadius.circular8,
        ),
        child: Text(
          buttonName,
          style: AppTextStyle.semiBold.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
