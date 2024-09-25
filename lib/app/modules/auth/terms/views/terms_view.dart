import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:privata/app/modules/auth/terms/controllers/terms_controller.dart';

import '../../../../../utils/constants_strings.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsStrings.terms),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.webViewC.reload(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Obx(
          () {
            if (controller.progressLoading.value == 100) {
              return WebViewWidget(controller: controller.webViewC);
            } else {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  value: controller.progressLoading.value / 100,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
