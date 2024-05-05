import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/login/view/login_view.dart';
import 'package:mylearning/features/register/view/register_view.dart';
import 'package:mylearning/utils/assets/app_images.dart';
import 'package:mylearning/utils/decorations/app_border_radius.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: FadeInUp(
        child: Stack(
          children: [
            Image.asset(
              AppImages.kBGImg,
              width: width,
              height: height,
            ),
            Padding(
              padding: AppPadding.padSymmetricHorizontal20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AppImages.kCompanyLogoImg,
                    width: 150,
                    height: 100,
                  ),
                  AppSpacing.gapH40,
                  CommonStyledButtonWidget(
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
                      buttonName: 'Login'),
                  AppSpacing.gapH16,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const RegisterView();
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.circular8,
                          border: Border.all(
                            color: AppColors.kDark,
                          )),
                      child: const Text(
                        'Register',
                        style: AppTextStyle.semiBold,
                      ),
                    ),
                  ),
                  AppSpacing.gapH40,
                  Text(
                    'Continue as a guest',
                    style: AppTextStyle.bold.copyWith(
                      color: AppColors.kPrimary,
                    ),
                  ),
                  AppSpacing.gapH32,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
