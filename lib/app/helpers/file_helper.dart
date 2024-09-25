import 'dart:math';

abstract class FileHelper {
  static String generateRandomFileName({
    required String uniqueNameFile,
    required String ext,
  }) {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = random.nextInt(10000); // Generate a random number
    return '$timestamp-${randomNum}_$uniqueNameFile.$ext';
  }
}
