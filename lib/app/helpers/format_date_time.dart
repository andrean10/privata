import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  static String dateToString({
    bool isIndonesian = false,
    String? oldPattern,
    required String newPattern,
    String? value,
  }) {
    if (value == null) return '-';

    DateTime inputDate;

    if (oldPattern != null) {
      String? locale;
      if (isIndonesian) {
        locale = 'id_ID';
      }

      final inputFormat = DateFormat(oldPattern, locale);
      inputDate = inputFormat.parse(value);
    } else {
      inputDate = DateTime.parse(value);
    }

    final outputFormat = DateFormat(newPattern, 'id_ID');
    return outputFormat.format(inputDate);
  }

  static DateTime? iso8601ToDateTime({
    String? pattern,
    String? value,
  }) {
    if (value == null) return null;
    if (pattern != null) {
      final outputFormat = DateFormat(pattern, 'id_ID');
      return outputFormat.tryParse(value);
    }
    return DateTime.tryParse(value);
  }

  static DateTime? iso8601ToString({
    required String pattern,
    required String? value,
  }) {
    if (value == null) return null;
    final outputFormat = DateFormat(pattern, 'id_ID');
    return outputFormat.parse(value);
  }

  static DateTime? stringToDateTime({
    String? oldPattern,
    required String newPattern,
    required String? value,
  }) {
    if (value == null) return null;

    DateTime inputDate;

    if (oldPattern != null) {
      final inputFormat = DateFormat(oldPattern, 'id_ID');
      inputDate = inputFormat.parse(value);
    } else {
      inputDate = DateTime.parse(value);
    }

    return inputDate;
  }

  static String timeToString({
    required String newPattern,
    required TimeOfDay value,
  }) {
    final outputFormat = DateFormat(newPattern, 'id_ID');
    final outputTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      value.hour,
      value.minute,
    );
    return outputFormat.format(outputTime);
  }

  // static DateTime stringToTime({
  //   required String pattern,
  //   required String value,
  // }) {
  //   final outputFormat = TimeOfDay(pattern, 'id_ID');
  //   return outputFormat.parse(value);
  // }
}
