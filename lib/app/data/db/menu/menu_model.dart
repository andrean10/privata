import 'package:flutter/widgets.dart';

class MenuModel {
  final String? iconAsset;
  final IconData? iconData;
  final String label;
  final Function()? onPressed;

  MenuModel({
    this.iconAsset,
    this.iconData,
    required this.label,
    this.onPressed,
  });
}
