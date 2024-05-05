import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/global_widgets/common_back_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_text_field_widget.dart';
import 'package:mylearning/features/login/view/login_view.dart';
import 'package:mylearning/utils/assets/app_images.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: AppPadding.padSymmetricHorizontal20,
          child: FlipInY(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonBackButtonWidget(),
                AppSpacing.gapH28,
                Text(
                  'Hello! Register to get started',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 30,
                    letterSpacing: 1,
                  ),
                ),
                AppSpacing.gapH32,
                const CommonTextFieldWidget(hintText: 'Username'),
                AppSpacing.gapH8,
                const CommonTextFieldWidget(hintText: 'Email'),
                AppSpacing.gapH8,
                const CommonTextFieldWidget(hintText: 'Password'),
                AppSpacing.gapH8,
                const CommonTextFieldWidget(hintText: 'Confirm password'),
                AppSpacing.gapH32,
                CommonStyledButtonWidget(onTap: () {}, buttonName: 'Register'),
                AppSpacing.gapH28,
                Row(
                  children: <Widget>[
                    const Expanded(child: Divider()),
                    Text(
                      "  Or Register with  ",
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.kDarkGray,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                AppSpacing.gapH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppImages.kFBButtonImg,
                      width: 100,
                      height: 50,
                    ),
                    Image.asset(
                      AppImages.kGoogleButtonImg,
                      width: 100,
                      height: 50,
                    ),
                    Image.asset(
                      AppImages.kAppleButtonImg,
                      width: 100,
                      height: 50,
                    ),
                  ],
                ),
                AppSpacing.gapH40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?\t',
                      style: AppTextStyle.medium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return const LoginView();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Login Now',
                        style: AppTextStyle.bold.copyWith(
                          color: AppColors.kPrimary,
                          letterSpacing: 1.5,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
