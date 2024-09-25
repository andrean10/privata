import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../shared/shared_theme.dart';
import '../controllers/printer_settings_controller.dart';
import 'dialog_search_devices.dart';

class PrinterSettingsView extends GetView<PrinterSettingsController> {
  const PrinterSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Printer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            builderMenu(
              context: context,
              titleMenu: 'Umum',
              children: [
                Obx(
                  () => builderItemMenu(
                    context: context,
                    title: 'Printer yang terhubung',
                    body: controller.namePrinter.value,
                    isEnabled: controller.isBluetoothOn.value,
                    onTap: () async {
                      showDialogBluetooth(context: context);
                    },
                  ),
                ),
                Obx(
                  () => builderItemMenu(
                    context: context,
                    title: 'Cetak struk tes',
                    isEnabled: controller.isBluetoothOn.value,
                    onTap: () {},
                  ),
                ),
                Obx(
                  () => builderItemMenu(
                    context: context,
                    title: 'Putuskan hubungan dengan printer',
                    isEnabled: controller.isBluetoothOn.value,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            builderMenu(
              context: context,
              titleMenu: 'Struk',
              children: [
                builderItemMenu(
                  context: context,
                  title: 'Struk cetak otomatis',
                  trailing: Obx(
                    () => Switch.adaptive(
                      value: controller.isChecked.value,
                      onChanged: controller.onChangedChecked,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget builderMenu({
    required BuildContext context,
    required String titleMenu,
    required List<Widget> children,
  }) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: AutoSizeText(
            titleMenu,
            style: textTheme.titleMedium
                ?.copyWith(fontWeight: SharedTheme.semiBold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children,
        )
      ],
    );
  }

  Widget builderItemMenu({
    required BuildContext context,
    required String title,
    String? body,
    Widget? trailing,
    bool? isEnabled,
    Function()? onTap,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    final textThemeTitle =
        textTheme.titleSmall?.copyWith(fontWeight: SharedTheme.medium);

    return ListTile(
      title: Text(title),
      titleTextStyle: (body != null)
          ? textTheme.titleSmall?.copyWith(
              fontWeight: SharedTheme.medium,
              color: theme.hintColor,
            )
          : textThemeTitle,
      subtitle: (body != null) ? Text(body) : null,
      subtitleTextStyle: textThemeTitle,
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: Border.all(color: theme.dividerColor.withOpacity(0.3)),
      enabled: isEnabled ?? true,
      onTap: onTap,
    );
  }

  Future showDialogBluetooth({required BuildContext context}) async {
    try {
      showAdaptiveDialog(
        context: context,
        builder: (context) {
          controller.startScan();

          return const Dialog.fullscreen(
            insetAnimationDuration: Duration(seconds: 15),
            child: DialogSearchDevices(),
          );
        },
      );
    } catch (e) {
      Logger().e('error: showDialogBluetooth = $e');
    }
  }
}
