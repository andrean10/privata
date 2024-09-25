import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum Day { senin, selasa, rabu, kamis, jumat, sabtu, minggu }

class PracticeScheduleModel {
  final String day;
  final RxList<TextEditingController> startTextC;
  final RxList<TextEditingController> endTextC;
  // final RxString text;

  PracticeScheduleModel({
    required this.day,
    required this.startTextC,
    required this.endTextC,
    // required this.text,
  });

  @override
  String toString() {
    return 'PracticeScheduleModel(day: $day, startTextC: $startTextC, endTextC: $endTextC)';
  }
}
