import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/buttons.dart';

abstract class Dialogs {
  static Widget builderAction(String textButton, bool result) {
    return (GetPlatform.isIOS || GetPlatform.isMacOS)
        ? CupertinoDialogAction(
            child: Text(textButton),
            onPressed: () => Get.back(result: result),
          )
        : Buttons.text(
            child: Text(textButton),
            onPressed: () => Get.back(result: result),
          );
  }

  static Future<bool?> alert({
    required BuildContext context,
    required String title,
    TextStyle? titleTextStyle,
    required Widget content,
    TextStyle? contentTextStyle,
    Widget? icon,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
    bool barrierDismissible = true,
    bool isSingleAction = false,
    String? textNo,
    String? textYes,
  }) {
    return showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog.adaptive(
        icon: icon,
        title: Text(title),
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        content: content,
        actions: actions ??
            [
              builderAction(textNo ?? 'Tidak', false),
              builderAction(textYes ?? 'Iya', true),
            ],
        actionsAlignment: actionsAlignment ?? MainAxisAlignment.end,
      ),
    );
  }

  static Future<bool?> logout({
    required BuildContext context,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
    bool barrierDismissible = true,
    String? textNo,
    String? textYes,
  }) {
    return showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog.adaptive(
        icon: const Icon(Icons.logout_rounded),
        title: const Text('Logout'),
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        content: const Text('Apakah anda yakin ingin logout dari aplikasi?'),
        actions: actions ??
            [
              Buttons.text(
                onPressed: () => Get.back(result: false),
                child: Text(textNo ?? 'Tidak'),
              ),
              Buttons.text(
                onPressed: () => Get.back(result: true),
                child: Text(textYes ?? 'Iya'),
              ),
            ],
        actionsAlignment: actionsAlignment ?? MainAxisAlignment.end,
      ),
    );
  }
}
