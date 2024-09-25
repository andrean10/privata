import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/utils/constants_assets.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../controllers/payment_status_controller.dart';

class PaymentStatusView extends GetView<PaymentStatusController> {
  const PaymentStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: builderStatus(context),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: builderAction(),
            )
          ],
        ),
      ),
    );
  }

  Widget builderStatus(BuildContext context) {
    final textTheme = context.textTheme;

    return Obx(
      () {
        String? image;
        String? title;
        String? description;

        if (controller.isSuccessfully.value) {
          image = ConstantsAssets.icPaymentSuccess;
          title = 'Pembayaran Berhasil';
          description =
              'Pembayaran anda telah berhasil selamat menggunakan sistem';
        } else {
          image = ConstantsAssets.icPaymentFailed;
          title = 'Pembayaran Gagal';
          description =
              'Transaksi anda tidak di proses, silahkan ulangi pembayaran untuk melanjutkan transaksi';
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: 300,
            ),
            const SizedBox(height: 22),
            AutoSizeText(
              title,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.semiBold,
              ),
            ),
            const SizedBox(height: 6),
            AutoSizeText(
              description,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget builderAction() {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Buttons.filled(
            width: double.infinity,
            onPressed: () {
              if (controller.isSuccessfully.value) {
                controller.moveToInvoice();
              } else {
                controller.moveToPayment();
              }
            },
            child: Text(
              (controller.isSuccessfully.value)
                  ? 'Lihat bukti transaksi'
                  : 'Ulangi Pembayaran',
            ),
          ),
          const SizedBox(height: 12),
          Buttons.outlined(
            width: double.infinity,
            onPressed: controller.moveToMain,
            child: const Text('Kembali ke home'),
          ),
        ],
      ),
    );
  }
}
