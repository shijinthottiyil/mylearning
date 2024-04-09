import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/global_widgets/common_back_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_text_field_widget.dart';
import 'package:mylearning/features/otp_verification/view/otp_verification_view.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.padSymmetricHorizontal20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonBackButtonWidget(),
                AppSpacing.gapH28,
                Text(
                  'Forgot Password?',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 30,
                    letterSpacing: 1,
                  ),
                ),
                AppSpacing.gapH8,
                Text(
                  '''Don't worry! It occurs. Please enter the email address linked with your account.''',
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.kGray,
                  ),
                ),
                AppSpacing.gapH32,
                CommonTextFieldWidget(hintText: 'Enter your email'),
                AppSpacing.gapH40,
                CommonStyledButtonWidget(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return OtpVerificationView();
                        },
                      ));
                    },
                    buttonName: 'Send Code'),
                AppSpacing.gapH300,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember Password?\t',
                      style: AppTextStyle.medium,
                    ),
                    Text(
                      'Login',
                      style: AppTextStyle.bold.copyWith(
                        color: AppColors.kPrimary,
                        letterSpacing: 1.5,
                      ),
                    ),
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
