import 'package:flutter/material.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: 60,
      padding: AppPadding.padSymmetricHorizontal16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F9),
        borderRadius: AppBorderRadius.circular8,
      ),
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
      ),
    );
  }
}
