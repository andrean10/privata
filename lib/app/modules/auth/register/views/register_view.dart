import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../../helpers/text_helper.dart';
import '../../../../helpers/validations.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builderBody(context),
    );
  }

  Widget builderBody(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final width = context.mediaQuerySize.width;
    final orientation = context.orientation;

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
            builderContent(theme, textTheme),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          builderFullName(),
          removeSpace(),
          builderPhone(),
          removeSpace(),
          builderEmail(),
          removeSpace(),
          builderUsername(),
          removeSpace(),
          builderPassword(),
        ],
      ),
    );
  }

  Widget removeSpace() {
    return Obx(
      () => Visibility(
        visible: controller.errMsg.value == null,
        child: const SizedBox(height: 12),
      ),
    );
  }

  Widget builderFullName() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.fullNameC,
        focusNode: controller.fullNameF,
        title: ConstantsStrings.registerTitleFullName,
        hintText: ConstantsStrings.registerHintFullName,
        isLabel: true,
        suffixIconState: controller.fullName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.registerTitleFullName,
        ),
        errorText: controller.errMsg.value != null ? '' : null,
      ),
    );
  }

  Widget builderPhone() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.phoneC,
        focusNode: controller.phoneF,
        title: ConstantsStrings.registerTitlePhone,
        hintText: ConstantsStrings.registerHintPhone,
        isLabel: true,
        suffixIconState: controller.phone.value.isNotEmpty,
        keyboardType: TextInputType.phone,
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        maxLength: 13,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.registerTitlePhone,
          isNumericOnly: true,
        ),
        errorText: controller.errMsg.value != null ? '' : null,
      ),
    );
  }

  Widget builderEmail() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.emailC,
        focusNode: controller.emailF,
        title: ConstantsStrings.registerTitleEmail,
        hintText: ConstantsStrings.hintUsernameOrEmail,
        isLabel: true,
        suffixIconState: controller.email.value.isNotEmpty,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.registerTitleEmail,
          isEmail: true,
        ),
        errorText: controller.errEmail.value,
      ),
    );
  }

  Widget builderUsername() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.usernameC,
        focusNode: controller.usernameF,
        title: ConstantsStrings.registerTitleUsername,
        hintText: ConstantsStrings.registerHintUsername,
        isLabel: true,
        suffixIconState: controller.username.value.isNotEmpty,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.registerTitleUsername,
        ),
        errorText: controller.errUsername.value,
      ),
    );
  }

  Widget builderPassword() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.passwordC,
        focusNode: controller.passwordF,
        title: ConstantsStrings.password,
        hintText: ConstantsStrings.hintPassword,
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

  Widget builderContent(
    ThemeData theme,
    TextTheme textTheme,
  ) {
    return Cards.elevated(
      inPadding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              ConstantsStrings.register,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 16),
            builderForm(),
            const SizedBox(height: 16),
            Buttons.text(
              style: ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(theme.colorScheme.onSurface),
              ),
              onPressed: controller.moveToTerms,
              child: TextHelper.buildRichText(
                text: ConstantsStrings.registerTerms,
                highlight: ConstantsStrings.assist,
                highlightStyle: TextStyle(color: theme.colorScheme.primary),
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
              child: const Text(ConstantsStrings.register),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Buttons.text(
          onPressed: controller.moveToLogin,
          child: const Text(ConstantsStrings.registerTo),
        ),
      ],
    );
  }
}
