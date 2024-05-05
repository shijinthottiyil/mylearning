import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/create_new_password/view/create_new_pasword_view.dart';
import 'package:mylearning/features/global_widgets/common_back_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.padSymmetricHorizontal20,
            child: SlideInUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonBackButtonWidget(),
                  AppSpacing.gapH28,
                  Text(
                    'OTP Verification',
                    style: AppTextStyle.bold.copyWith(
                      fontSize: 30,
                      letterSpacing: 1,
                    ),
                  ),
                  AppSpacing.gapH8,
                  Text(
                    '''Enter the verification code we just sent on your email address.''',
                    style: AppTextStyle.medium.copyWith(
                      fontSize: 16,
                      color: AppColors.kGray,
                    ),
                  ),
                  AppSpacing.gapH32,
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: PinTheme(
                      width: 70,
                      height: 60,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F8F9),
                        borderRadius: AppBorderRadius.circular8,
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 70,
                      height: 60,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kPrimary),
                        borderRadius: AppBorderRadius.circular8,
                      ),
                    ),
                  ),
                  AppSpacing.gapH40,
                  CommonStyledButtonWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return const CreateNewPasswordView();
                            },
                          ),
                        );
                      },
                      buttonName: 'Verify'),
                  AppSpacing.gapH300,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Didn’t received code? \t',
                        style: AppTextStyle.medium,
                      ),
                      Text(
                        'Resend',
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
      ),
    );
  }
}
