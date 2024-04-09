import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylearning/features/forgot_password/view/forgot_password_view.dart';
import 'package:mylearning/features/global_widgets/common_back_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_text_field_widget.dart';
import 'package:mylearning/features/register/view/register_view.dart';
import 'package:mylearning/utils/assets/app_images.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.padSymmetricHorizontal20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonBackButtonWidget(),
                AppSpacing.gapH28,
                Text(
                  'Welcome back! Glad \nto see you, Again!',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 30,
                    letterSpacing: 1,
                  ),
                ),
                AppSpacing.gapH32,
                CommonTextFieldWidget(hintText: 'Enter your email'),
                AppSpacing.gapH16,
                Container(
                  width: width,
                  height: 60,
                  padding: AppPadding.padSymmetricHorizontal16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8F9),
                    borderRadius: AppBorderRadius.circular8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'Enter your password'),
                        ),
                      ),
                      Icon(Icons.visibility_outlined)
                    ],
                  ),
                ),
                AppSpacing.gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return ForgotPasswordView();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyle.semiBold,
                      ),
                    )
                  ],
                ),
                AppSpacing.gapH32,
                CommonStyledButtonWidget(onTap: () {}, buttonName: 'Login'),
                AppSpacing.gapH32,
                Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Text(
                      "  Or Login with  ",
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.kDarkGray,
                      ),
                    ),
                    Expanded(child: Divider()),
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
                AppSpacing.gapH100,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?\t',
                      style: AppTextStyle.medium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return RegisterView();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Register Now',
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
        ),
      ),
    );
  }
}
