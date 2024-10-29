import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/menu_setting/billing_landing/main/controllers/billing_landing_controller.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';

import '../../../../../../widgets/buttons/buttons.dart';

class BillingEmptyScreen extends GetView<BillingLandingController> {
  const BillingEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuerySize.width;
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ConstantsAssets.icEmptyBilling,
                  width: width / 7,
                ),
                const SizedBox(height: 35),
                AutoSizeText(
                  'Kamu belum memiliki paket langganan',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              'Riwayat Transaksi',
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: SharedTheme.bold),
            ),
          ),
          const SizedBox(height: 21),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ConstantsAssets.icEmptyBilling2,
                  width: width / 7,
                ),
                const SizedBox(height: 35),
                AutoSizeText(
                  'Kamu belum pernah melakukan transaksi',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Buttons.filled(
              width: double.infinity,
              onPressed: controller.moveToPackages,
              child: const Text('Pilih Langganan'),
            ),
          ),
        ],
      ),
    );
  }
}
