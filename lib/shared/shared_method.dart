import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar({
  required BuildContext context,
  String? content,
  Widget? contentBuilder,
  // String? path,
  TextStyle? textStyle,
  required Color backgroundColor,
  Duration? duration,
  SnackBarBehavior? behavior,
  SnackBarAction? action,
}) {
  final textTheme = Theme.of(context).textTheme;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: contentBuilder ??
          Text(
            content ?? '',
            style: textStyle ??
                textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
      backgroundColor: backgroundColor,
      duration: duration ?? 3.minutes,
      behavior: behavior,
      action: action,
    ),
  );
}
