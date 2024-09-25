import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../routes/app_pages.dart';
import '../../../widgets/buttons/buttons.dart';

class VerifyForgotPasswordView extends StatelessWidget {
  const VerifyForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = context.orientation;
    final width = context.mediaQuerySize.width;
    final height = context.mediaQuerySize.height;
    final textTheme = context.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ConstantsAssets.icVerifyForgotPassword,
                width: (orientation == Orientation.portrait)
                    ? width * 0.6
                    : width / 4,
              ),
              SizedBox(height: height / 34),
              AutoSizeText(
                ConstantsStrings.verifyForgotPass,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                ),
                maxFontSize: textTheme.headlineMedium!.fontSize!,
              ),
              SizedBox(height: height / 34),
              AutoSizeText(
                ConstantsStrings.verifyForgotPassBody,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height / 18),
              Buttons.filled(
                onPressed: () => Get.offAllNamed(Routes.LOGIN),
                child: const Text(ConstantsStrings.verifyForgotPassBackTo),
              )
            ],
          ),
        ),
      ),
    );
  }
}
