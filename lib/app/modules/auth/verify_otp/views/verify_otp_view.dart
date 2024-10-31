import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final orientation = context.orientation;

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ConstantsStrings.logout,
                child: const Text(ConstantsStrings.logout),
                onTap: () {
                  Dialogs.logout(
                    context: context,
                    initC: controller.initC,
                  );
                },
              )
            ],
            position: PopupMenuPosition.under,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 21,
            horizontal: 16,
          ),
          child: Column(
            children: [
              builderHead(orientation),
              const SizedBox(height: 16),
              builderBody(
                theme: theme,
                textTheme: textTheme,
              ),
              const SizedBox(height: 16),
              builderFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget builderHead(Orientation orientation) {
    return Align(
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return Hero(
            tag: ConstantsAssets.icSplash,
            child: Image.asset(
              ConstantsAssets.icSplash,
              width: (orientation == Orientation.portrait)
                  ? maxWidth / 2
                  : maxWidth / 3,
            ),
          );
        },
      ),
    );
  }

  Widget builderForm() {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;

      return Form(
        key: controller.formKey,
        onChanged: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) {
                  final otpC = controller.listOtpC[index];
                  final otpF = controller.listOtpF[index];

                  return SizedBox(
                    width: maxWidth / 8,
                    child: builderItemOTP(
                      index: index,
                      ctr: otpC,
                      focusNode: otpF,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 5) {
                            controller.nextFocus(controller.listOtpF[index]);
                          } else {
                            controller.clearFocus(context);
                          }
                        } else {
                          controller.previousFocus(otpF);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget builderItemOTP({
    required int index,
    required TextEditingController ctr,
    required FocusNode focusNode,
    void Function(String)? onChanged,
    void Function(dynamic)? onFieldSubmitted,
  }) {
    return Obx(
      () => TextFormFields.otp(
        controller: ctr,
        focusNode: focusNode,
        errorText: controller.errMsg.value != null ? '' : null,
        isAutoFocus: index == 0,
        textInputAction:
            (index != 5) ? TextInputAction.next : TextInputAction.done,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  Widget builderBody({
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    return Cards.elevated(
      inPadding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              ConstantsStrings.verifyOTP,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              '${ConstantsStrings.verifyOTPBody} ${controller.phone}',
              style: textTheme.bodyMedium,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            builderForm(),
            Obx(
              () => Visibility(
                visible: controller.errMsg.value != null,
                child: Center(
                  child: AutoSizeText(
                    '${controller.errMsg.value}',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Obx(
                () => AutoSizeText(
                  controller.timerC.timeLeft.value,
                  style: textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builderFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Buttons.filled(
                onPressed: (controller.timerC.timeLeft.value == '00:00')
                    ? controller.retryOTP
                    : null,
                state: controller.isLoadingRetry.value,
                child: const Text(ConstantsStrings.verifyOTPRetry),
              ),
            ),
            Obx(
              () => Buttons.filled(
                onPressed: (controller.isButonEnabled.value)
                    ? controller.confirm
                    : null,
                state: controller.isLoading.value,
                child: const Text(ConstantsStrings.ok),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
