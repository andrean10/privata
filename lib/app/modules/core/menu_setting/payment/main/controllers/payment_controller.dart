import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/services/payment/payment_connect.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../data/models/payment/billing_model.dart';
import '../../../../../../routes/app_pages.dart';

class PaymentController extends GetxController {
  late final InitController _initC;
  late final PaymentConnect _paymentCn;

  late final WebViewController webViewC;
  late final PlatformWebViewControllerCreationParams params;

  final loadingProgress = 0.obs;

  String? url;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _paymentCn = PaymentConnect();

    _initWebView();
    await _getToken();
  }

  void _initWebView() {
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    webViewC = WebViewController.fromPlatformCreationParams(params);
    webViewC
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final host = Uri.parse(request.url).toString();
            if (host.contains('gojek://') ||
                host.contains('shopeeid://') ||
                host.contains('//wsa.wallet.airpay.co.id/') ||
                // This is handle for sandbox Simulator
                host.contains('/gopay/partner/') ||
                host.contains('/shopeepay/') ||
                host.contains('/pdf')) {
              _launchInExternalBrowser(Uri.parse(request.url));
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
          onHttpAuthRequest: (request) {
            _initC.logger.d('debug: onHttpAuthRequest = ${request.toString()}');
          },
          onHttpError: (error) {
            _initC.logger.e('error: onHttpError = ${error.toString()}');
          },
          onWebResourceError: (error) {
            _initC.logger.e('error: onWebResourceError = ${error.toString()}');
          },
          onProgress: (progress) {
            _initC.logger.i('info: loading progress = $progress');
            loadingProgress.value = progress;
          },
          onUrlChange: (change) {
            _initC.logger.d('debug: onUrlChange = ${change.toString()}');
          },
          onPageStarted: (url) {
            _initC.logger.d('debug: onPageStarted = $url');
          },
          onPageFinished: (url) {
            _initC.logger.d('debug: onPageFinished = $url');

            final host = Uri.parse(url);
            _initC.logger
                .d('debug: path segment = ${host.fragment.split('/')}');

            final lastSegment = host.fragment.split('/').last;
            _initC.logger.d('debug: last segment = $lastSegment');
            _initC.logger
                .d('debug: isSuccess = ${lastSegment.contains('success')}');

            if (lastSegment.contains('success')) {
              _moveToPaymentStatus(isSuccessfully: true);
            }

            if (lastSegment.contains('408')) {
              _moveToPaymentStatus(isSuccessfully: false);
            }
          },
        ),
      );

    if (webViewC.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (webViewC.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  Future<void> _getToken() async {
    try {
      final payload = {
        "transaction_details": {
          "order_id": "privata-${DateTime.now().toIso8601String()}",
          "gross_amount": 100000,
        },
        "credit_card": {"secure": true},
        "item_details": [
          {
            "id": "pd-1",
            "price": 50000,
            "quantity": 1,
            "name": "Pulsa 50k",
            "brand": "Telkomsel",
            "category": "Tech",
            "merchant_name": "Privata",
            "url": "https://www.telkomsel.com/"
          },
          {
            "id": "pd-1",
            "price": 50000,
            "quantity": 1,
            "name": "Pulsa 50k",
            "brand": "Three",
            "category": "Tech",
            "merchant_name": "Privata",
            "url": "https://tri.co.id/"
          }
        ],
        "customer_details": {
          "first_name": "Andrean",
          "last_name": "Ramadhan",
          // "email": "andrean.ramadhan@assist.id",
          "phone": "+6282282359296",
          "billing_address": {
            "first_name": "TEST BILLING",
            "last_name": "MIDTRANSER",
            "email": "testbilling@midtrans.com",
            "phone": "081 2233 44-55",
            "address": "Sudirman",
            "city": "Jakarta",
            "postal_code": "12190",
            "country_code": "IDN"
          },
          "shipping_address": {
            "first_name": "TEST SHIPPING",
            "last_name": "MIDTRANSER",
            "email": "testshipping@midtrans.com",
            "phone": "0 8128-75 7-9338",
            "address": "Sudirman",
            "city": "Jakarta",
            "postal_code": "12190",
            "country_code": "IDN"
          }
        }
      };

      final res = await _paymentCn.getToken(payload);

      if (res.isOk) {
        final billing = BillingModel.fromJson(res.body);
        url = billing.url;

        if (url != null) {
          webViewC.loadRequest(Uri.parse(url!));
        }

        // await _initC.localStorage.remove(ConstantsKeys.paymentToken);
        // await _initC.localStorage.write(ConstantsKeys.paymentToken, token);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('error: ${e.toString()}');
    }
  }

  Future<void> _launchInExternalBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  void _moveToPaymentStatus({required bool isSuccessfully}) => Get.offAllNamed(
        Routes.PAYMENT_STATUS,
        arguments: isSuccessfully,
      );
}
