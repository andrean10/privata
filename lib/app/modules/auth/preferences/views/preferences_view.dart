import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/widgets/dialog/dialogs.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';
import 'package:privata/shared/shared_theme.dart';

import '../../../../../utils/constants_strings.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../controllers/preferences_controller.dart';

class PreferencesView extends GetView<PreferencesController> {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(textTheme, theme),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text(ConstantsStrings.pref),
      centerTitle: true,
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
    );
  }

  Widget builderBody(TextTheme textTheme, ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Cards.elevated(
            inPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    ConstantsStrings.prefTitle,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: SharedTheme.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                TextFormFields.dropdown(
                  title: ConstantsStrings.prefTitleLongClinicOperating,
                  items: ConstantsStrings.prefListLongClinicOperating.indexed
                      .map(
                        (e) => DropdownMenuEntry(value: e.$1, label: e.$2),
                      )
                      .toList(),
                  isRequired: true,
                  isExpanded: true,
                  onSelected: (value) {
                    if (value != null) {
                      controller.longClinicOperating.value =
                          ConstantsStrings.prefListLongClinicOperating[value];
                    }
                  },
                ),
                const SizedBox(height: 12),
                Obx(
                  () => builderSwitch(
                    textTheme: textTheme,
                    title: ConstantsStrings.prefTitleRMD,
                    subtitle: ConstantsStrings.prefSubtitleRMD,
                    value: controller.isActiveRMD.value,
                    onChanged: controller.setActiveRMD,
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  () => builderSwitch(
                    textTheme: textTheme,
                    title: ConstantsStrings.prefTitleStock,
                    subtitle: ConstantsStrings.prefSubtitleStock,
                    value: controller.isActiveStock.value,
                    onChanged: controller.setActiveStock,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormFields.dropdown(
                  title: ConstantsStrings.prefTitleNumberVisitors,
                  items: ConstantsStrings.prefListNumberVisitors.indexed
                      .map(
                        (e) => DropdownMenuEntry(value: e.$1, label: e.$2),
                      )
                      .toList(),
                  isRequired: true,
                  isExpanded: true,
                  onSelected: (value) {
                    if (value != null) {
                      controller.numberVisitor.value =
                          ConstantsStrings.prefListNumberVisitors[value];
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () {
              final isEnabled = controller.longClinicOperating.value != null &&
                  controller.numberVisitor.value != null &&
                  !controller.isLoading.value;

              return Buttons.filled(
                width: double.infinity,
                onPressed: isEnabled ? controller.confirm : null,
                state: controller.isLoading.value,
                child: const Text(ConstantsStrings.save),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget builderSwitch({
    required TextTheme textTheme,
    required bool value,
    required ValueChanged<bool> onChanged,
    required String title,
    required String subtitle,
  }) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      title: TextHelper.buildRichText(
        text: '$title *',
        highlight: '*',
        defaultStyle: textTheme.titleMedium,
        highlightStyle: const TextStyle(color: Colors.red),
      ),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.zero,
    );
  }
}
