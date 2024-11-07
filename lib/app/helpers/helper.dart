import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:privata/app/helpers/format_date_time.dart';

abstract class Helper {
  static String getAge(String? value) {
    if (value == null) return '-';

    final dateNow = DateTime.now();
    final birthDate = FormatDateTime.stringToDateTime(
      newPattern: "yyyy-MM-dd",
      value: value,
    );

    var age = dateNow.year - birthDate!.year;
    // check month
    if (dateNow.month < birthDate.month) {
      if (dateNow.day < birthDate.day) {
        age -= 1;
      }
    }
    return '$age';
  }

  static bool isTimeInRange({
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required TimeOfDay selectedTime,
  }) {
    final int selectedHour = selectedTime.hour;
    final int selectedMinute = selectedTime.minute;

    // Membandingkan waktu dalam format menit
    final int startInMinutes = startTime.hour * 60 + startTime.minute;
    final int endInMinutes = endTime.hour * 60 + endTime.minute;
    final int selectedInMinutes = selectedHour * 60 + selectedMinute;

    return selectedInMinutes >= startInMinutes &&
        selectedInMinutes <= endInMinutes;
  }

  static void printPrettyJson(Object json) {
    const encoder =
        JsonEncoder.withIndent('  '); // Menggunakan indentasi 2 spasi
    String prettyJson = encoder.convert(json);
    print(prettyJson);
  }

  static void logPrettyJson(Object json) {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0, // Menghilangkan metode debug stack
        errorMethodCount: 0,
        colors: false,
        printEmojis: false,
        printTime: false,
      ),
    );
    const encoder = JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(json);
    logger.i(prettyJson);
  }
  
  
  static Future<XFile?> pickFile(ImageSource source) async {
    try {
      final xFile = await ImagePicker().pickImage(source: source);
      return xFile;
    } on Exception catch (e) {
      Logger().e('error: pickImage = $e');
    }

    return null;
  }

  static Future<CroppedFile?> cropImage({
    required XFile imageFile,
  }) async {
    final theme = Get.context!.theme;

    return await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Pangkas Gambar',
          toolbarColor: theme.colorScheme.primaryContainer,
          toolbarWidgetColor: theme.colorScheme.primary,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            // CropAspectRatioPresetCustom(),
          ],
          cropStyle: CropStyle.circle,
        ),
        IOSUiSettings(
          title: 'Pangkas Gambar',
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            // CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        // WebUiSettings(
        //   context: context,
        // ),
      ],
    );
  }
}
