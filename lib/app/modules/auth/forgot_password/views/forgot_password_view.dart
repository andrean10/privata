import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../../../utils/constants_strings.dart';
import '../../../../helpers/validations.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final orientation = context.orientation;

    return Scaffold(
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
              builderBody(textTheme),
              const SizedBox(height: 16),
              builderFooter()
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
                  ? maxWidth / 4
                  : maxWidth / 5,
            ),
          );
        },
      ),
    );
  }

  Widget builderForm() {
    return Form(
      key: controller.formKey,
      child: builderEmail(),
    );
  }

  Widget builderEmail() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.emailC,
        focusNode: controller.emailF,
        title: ConstantsStrings.usernameOrEmail,
        hintText: ConstantsStrings.hintUsernameOrEmail,
        isLabel: true,
        suffixIconState: controller.email.value.isNotEmpty,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.usernameOrEmail,
          isEmail: true,
        ),
        errorText: controller.errMsg.value != null ? '' : null,
        onFieldSubmitted: (value) => controller.confirm(),
      ),
    );
  }

  Widget builderBody(TextTheme textTheme) {
    return Cards.elevated(
      inPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 21,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              ConstantsStrings.forgotPassword,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 16),
            builderForm(),
          ],
        ),
      ),
    );
  }

  Widget builderFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Obx(
            () => Buttons.filled(
              onPressed: controller.confirm,
              state: controller.isLoading.value,
              child: const Text(ConstantsStrings.confirm),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Buttons.text(
          onPressed: controller.moveToLogin,
          child: const Text(ConstantsStrings.forgotTo),
        ),
      ],
    );
  }
}
