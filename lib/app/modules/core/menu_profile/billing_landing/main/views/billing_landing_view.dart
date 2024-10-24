import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/modules/core/menu_profile/billing_landing/main/views/state/billing_state_screen.dart';
import 'package:privata/app/modules/core/menu_profile/billing_landing/main/views/empty/billing_empty_screen.dart';

import '../controllers/billing_landing_controller.dart';

class BillingLandingView extends GetView<BillingLandingController> {
  const BillingLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Langganan Klinik Anda'),
        centerTitle: true,
      ),
      body: Container(
        color: theme.colorScheme.secondaryFixedDim,
        child: switch (controller.state.value) {
          BillingState.empty => const BillingEmptyScreen(),
          _ => const BillingStateScreen()
        },
      ),
    );
  }
}
