import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            alignment: Alignment.topCenter,
            children: [
              WebViewWidget(controller: controller.webViewC),
              if (controller.loadingProgress.value < 100)
                LinearProgressIndicator(
                  value: controller.loadingProgress.value / 100.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
