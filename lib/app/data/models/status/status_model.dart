import 'package:flutter/material.dart';

class StatusModel {
  final Color color;
  final String value;

  StatusModel({required this.color, required this.value});
  
  @override
  String toString() {
    return 'StatusModel(color: $color, value: $value)';
  }
}
