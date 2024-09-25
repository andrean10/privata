import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/utils/constants_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';

class TermsController extends GetxController {
  late final InitController _initC;
  late final WebViewController webViewC;

  final isLoading = false.obs;
  final progressLoading = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    late final PlatformWebViewControllerCreationParams params;
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
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            progressLoading.value = progress;
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
code: ${error.errorCode}
description: ${error.description}
errorType: ${error.errorType}
isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );

    if (webViewC.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (webViewC.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    webViewC.loadHtmlString(ConstantsStrings.termsContentHTML);
  }
}
