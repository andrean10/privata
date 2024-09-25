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
}
