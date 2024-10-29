import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../helpers/validations.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuerySize.width;
    final textTheme = context.textTheme;
    final orientation = context.orientation;

    return Scaffold(
      body: builderBody(
        orientation: orientation,
        width: width,
        textTheme: textTheme,
      ),
    );
  }

  Widget builderBody({
    required Orientation orientation,
    required double width,
    required TextTheme textTheme,
  }) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 21,
          horizontal: (orientation == Orientation.landscape) ? (width / 3) : 21,
        ),
        child: Column(
          children: [
            builderHead(orientation),
            const SizedBox(height: 16),
            builderContent(textTheme),
            const SizedBox(height: 16),
            builderFooter()
          ],
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
                  ? maxWidth / 3
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          builderEmail(),
          Obx(
            () => Visibility(
              visible: controller.errMsg.value == null,
              child: const SizedBox(height: 12),
            ),
          ),
          builderPassword(),
        ],
      ),
    );
  }

  Widget builderEmail() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.emailC,
        focusNode: controller.emailF,
        title: ConstantsStrings.usernameOrEmail,
        // hintText: ConstantsStrings.hintUsernameOrEmail,
        isLabel: true,
        suffixIconState: controller.email.value.isNotEmpty,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.usernameOrEmail,
          isEmail: true,
        ),
        errorText: controller.errMsg.value != null ? '' : null,
        onFieldSubmitted: (_) => controller.nextFocus(controller.passwordF),
      ),
    );
  }

  Widget builderPassword() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.passwordC,
        focusNode: controller.passwordF,
        title: ConstantsStrings.password,
        // hintText: ConstantsStrings.hintPassword,
        isLabel: true,
        suffixIconState: controller.password.value.isNotEmpty,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        suffixIcon: IconButton(
          onPressed: controller.setHidePassword,
          icon: Icon(
            controller.isHidePassword.value
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
        ),
        obscureText: controller.isHidePassword.value,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.password,
          minLengthChar: 6,
        ),
        errorText: controller.errMsg.value,
        onFieldSubmitted: (_) => controller.confirm(),
      ),
    );
  }

  Widget builderContent(TextTheme textTheme) {
    return Cards.elevated(
      inPadding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              ConstantsStrings.login,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 16),
            builderForm(),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Buttons.text(
                onPressed: controller.moveToForgotPassword,
                child: const Text(ConstantsStrings.forgotPassword),
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
        Align(
          alignment: Alignment.topRight,
          child: Obx(
            () => Buttons.filled(
              onPressed: controller.confirm,
              state: controller.isLoading.value,
              child: const Text(ConstantsStrings.login),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Buttons.text(
          onPressed: controller.moveToRegister,
          child: const Text(ConstantsStrings.loginTo),
        ),
      ],
    );
  }
}
