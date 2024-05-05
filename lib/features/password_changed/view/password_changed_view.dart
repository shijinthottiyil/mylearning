import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/welcome/view/welcome_view.dart';
import 'package:mylearning/utils/assets/app_images.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.padSymmetricHorizontal20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.kSuccessImg,
              width: 100,
              height: 100,
            ),
            AppSpacing.gapH36,
            Text(
              'Password Changed!',
              style: AppTextStyle.bold.copyWith(
                fontSize: 26,
              ),
            ),
            AppSpacing.gapH8,
            const Text(
              'Your password has been changed\n successfully.',
              textAlign: TextAlign.center,
            ),
            AppSpacing.gapH40,
            CommonStyledButtonWidget(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                  builder: (context) {
                    return const WelcomeView();
                  },
                ), (route) => false);
              },
              buttonName: 'Back to Login',
            ),
          ],
        ),
      ),
    );
  }
}
