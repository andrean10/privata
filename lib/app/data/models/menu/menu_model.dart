import 'package:flutter/widgets.dart';

class MenuModel {
  final IconData icon;
  final String label;
  final Function()? onPressed;

  MenuModel({
    required this.icon,
    required this.label,
    this.onPressed,
  });
}
