import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/shared_theme.dart';

class BuilderStateBillingSystem extends StatelessWidget {
  final bool isPaid;

  const BuilderStateBillingSystem({
    required this.isPaid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    Color color;
    String stateText;

    if (isPaid) {
      stateText = 'Lunas';

      if (Get.isDarkMode) {
        color = SharedTheme.darkSuccessColor;
      } else {
        color = const Color(0xFF68BE79);
      }
    } else {
      stateText = 'Belum Lunas';

      if (Get.isDarkMode) {
        color = SharedTheme.darkWarningColor;
      } else {
        color = SharedTheme.lightWarningColor;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: AutoSizeText(
        stateText,
        style: textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.surface,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
