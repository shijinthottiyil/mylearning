import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/global_widgets/common_back_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_styled_button_widget.dart';
import 'package:mylearning/features/global_widgets/common_text_field_widget.dart';
import 'package:mylearning/features/password_changed/view/password_changed_view.dart';
import 'package:mylearning/utils/decorations/app_colors.dart';
import 'package:mylearning/utils/decorations/app_padding.dart';
import 'package:mylearning/utils/decorations/app_spacing.dart';
import 'package:mylearning/utils/decorations/app_text_style.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.padSymmetricHorizontal20,
            child: FlipInX(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonBackButtonWidget(),
                  AppSpacing.gapH28,
                  Text(
                    'Create new password',
                    style: AppTextStyle.bold.copyWith(
                      fontSize: 30,
                      letterSpacing: 1,
                    ),
                  ),
                  AppSpacing.gapH8,
                  Text(
                    '''Your new password must be unique from those previously used.''',
                    style: AppTextStyle.medium.copyWith(
                      fontSize: 16,
                      color: AppColors.kGray,
                    ),
                  ),
                  AppSpacing.gapH32,
                  const CommonTextFieldWidget(hintText: 'New Password'),
                  AppSpacing.gapH8,
                  const CommonTextFieldWidget(hintText: 'Confirm Password'),
                  AppSpacing.gapH40,
                  CommonStyledButtonWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return const PasswordChangedView();
                            },
                          ),
                        );
                      },
                      buttonName: 'Reset Password'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
