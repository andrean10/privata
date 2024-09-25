import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlHelper {
  static final Logger logger = Logger();

  static Future<void> openUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      logger.e('can launch uri $uri');
    }
  }

  static Uri sms(String number) {
    return Uri(
      scheme: 'sms',
      // path: '0118 999 881 999 119 7253',
      path: number,
      queryParameters: {
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
  }

  static Uri tel(String number) {
    return Uri(
      scheme: 'tel',
      // path: '0118 999 881 999 119 7253',
      path: number,
    );
  }
}
