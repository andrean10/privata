import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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

    // if (defaultTargetPlatform == TargetPlatform.macOS) {
    //   return CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       middle: const Text(ConstantsStrings.pref),
    //       trailing: PopupMenuButton(
    //         itemBuilder: (context) => [
    //           PopupMenuItem(
    //             value: ConstantsStrings.logout,
    //             child: const Text(ConstantsStrings.logout),
    //             onTap: () {},
    //           )
    //         ],
    //         icon: const Icon(Icons.more_vert_rounded),
    //       ),
    //     ),
    //     child: builderBody(textTheme, theme),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsStrings.pref),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ConstantsStrings.logout,
                child: const Text(ConstantsStrings.logout),
                onTap: () async {
                  final result = await Dialogs.logout(context: context);

                  if (result ?? false) {
                    await controller.logOut();
                  }
                },
              )
            ],
            position: PopupMenuPosition.under,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: builderBody(textTheme, theme),
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
                  // controller: controller.longClinicOperatingC,
                  // focusNode: controller.longClinicOperatingF,
                  title: ConstantsStrings.prefTitleLongClinicOperating,
                  items: ConstantsStrings.prefListLongClinicOperating.indexed
                      .map(
                        (e) => DropdownMenuEntry(value: e.$1, label: e.$2),
                      )
                      .toList(),
                  textStyle: textTheme.titleMedium,
                  isExpanded: true,
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
                  // controller: controller.numberVisitorC,
                  // focusNode: controller.numberVisitorF,
                  title: ConstantsStrings.prefTitleNumberVisitors,
                  items: ConstantsStrings.prefListNumberVisitors.indexed
                      .map(
                        (e) => DropdownMenuEntry(value: e.$1, label: e.$2),
                      )
                      .toList(),
                  textStyle: textTheme.titleMedium,
                  isExpanded: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Buttons.filled(
            width: double.infinity,
            onPressed: controller.moveToFaskesInfo,
            child: const Text(ConstantsStrings.save),
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
      title: Text(
        title,
        style: textTheme.titleMedium,
      ),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.zero,
    );
  }
}
