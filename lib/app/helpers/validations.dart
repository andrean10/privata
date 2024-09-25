import 'package:get/get.dart';
import 'package:privata/app/data/models/range/range_model.dart';

abstract class Validation {
  static String? formField({
    required String titleField,
    required String? value,
    bool isNumericOnly = false,
    bool isEmail = false,
    bool isNotZero = false,
    num minLength = 0,
    num? maxLength,
    RangeModel? range,
    String? messageEmpty,
    String? messageMinChar,
    String? messageMaxChar,
  }) {
    if (value != null) {
      if (value.isEmpty) {
        return '$titleField harus di isi!';
      }

      if (isNumericOnly) {
        if (!value.isNumericOnly) {
          return messageEmpty ?? 'Inputan $titleField harus berupa angka!';
        }

        if (isNotZero) {
          if (int.parse(value) == 0) {
            return 'Nilai field harus lebih dari 0';
          }
        }

        if (range != null) {
          final minRange = range.minRange;
          final maxRange = range.maxRange;
          final typeRange = range.type;

          if (int.parse(value) < minRange) {
            return '$titleField kurang rentang ($minRange - $maxRange $typeRange)';
          }

          if (int.parse(value) > maxRange) {
            return '$titleField melebihi rentang ($minRange - $maxRange $typeRange)';
          }
        }
      }

      if (isEmail) {
        if (!value.isEmail) {
          return 'Format $titleField tidak sesuai';
        }
      }

      if (value.length.isLowerThan(minLength)) {
        return messageMinChar ??
            '$titleField minimal harus $minLength karakter!';
      }

      if (maxLength != null &&
          isNumericOnly &&
          value.isNumericOnly &&
          int.parse(value).isGreaterThan(maxLength)) {
        return messageMaxChar ??
            '$titleField melewati maksimal $maxLength karakter';
      }
    }
    return null;
  }
}
