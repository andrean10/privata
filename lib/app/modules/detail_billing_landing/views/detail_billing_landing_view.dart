import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/modules/core/menu_profile/billing_landing/widget/builder_state_billing_system.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';

import '../../../../shared/shared_theme.dart';
import '../../../helpers/text_helper.dart';
import '../controllers/detail_billing_landing_controller.dart';

class DetailBillingLandingView extends GetView<DetailBillingLandingController> {
  const DetailBillingLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
        centerTitle: true,
        actions: [
          Buttons.text(
            onPressed: controller.moveToInvoice,
            child: const Text('Lihat Invoice'),
          ),
        ],
      ),
      body: builderContent(context),
    );
  }

  Widget builderContent(BuildContext context) {
    final theme = context.theme;

    return Container(
      color: theme.colorScheme.secondaryFixed,
      child: Column(
        children: [
          const SizedBox(height: 8),
          builderSubscriptionPackage(context),
          const SizedBox(height: 12),
          builderDetail(context),
        ],
      ),
    );
  }

  Widget builderSubscriptionPackage(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Clinica Pro'),
            titleTextStyle: textTheme.labelLarge
                ?.copyWith(fontWeight: SharedTheme.semiBold),
            subtitle: const Text('6 Bulan'),
            subtitleTextStyle:
                textTheme.bodySmall?.copyWith(color: theme.hintColor),
            trailing:
                BuilderStateBillingSystem(isPaid: controller.data.isPurchased),
          ),
        ],
      ),
    );
  }

  Widget builderDetail(BuildContext context) {
    final theme = context.theme;
    final data = controller.data;

    return Expanded(
      child: Container(
        color: theme.colorScheme.surface,
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                builderItemDetail(
                  context: context,
                  title: 'Nomor Invoice',
                  subtitle: data.noInvoice,
                  isCopyData: true,
                ),
                builderItemDetail(
                  context: context,
                  title: 'Tanggal Transaksi',
                  // subtitle: '22 September 2022, 10:00',
                  subtitle: FormatDateTime.dateToString(
                    newPattern: 'dd MMMM yyyy, HH:mm',
                    value: data.transactionDate.toString(),
                  ),
                ),
                builderItemDetail(
                  context: context,
                  title: 'Kuota Kunjungan',
                  subtitle: '${data.visitor}/${data.maxVisitor}',
                ),
                builderItemDetail(
                  context: context,
                  title: 'Tanggal Berakhir',
                  subtitle: FormatDateTime.dateToString(
                    newPattern: 'dd MMMM yyyy',
                    value: data.endTransaction.toString(),
                  ),
                ),
                builderItemDetail(
                  context: context,
                  title: 'Metode Pembayaran',
                  subtitle: data.channelPayment,
                ),
                builderItemDetail(
                  context: context,
                  title: 'Total Tagihan',
                  subtitle: '${TextHelper.formatRupiah(
                    amount: data.total,
                    isCompact: false,
                  )}',
                ),
              ],
            ),
            builderCompletePayment(),
          ],
        ),
      ),
    );
  }

  Widget builderItemDetail({
    required BuildContext context,
    required String title,
    required String subtitle,
    bool isCopyData = false,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return ListTile(
      title: Text(title),
      titleTextStyle: textTheme.bodySmall?.copyWith(color: theme.hintColor),
      subtitle: Text(subtitle),
      subtitleTextStyle: textTheme.labelLarge,
      trailing: Visibility(
        visible: isCopyData,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.copy_rounded,
            size: 20,
          ),
          tooltip: 'Copy No. Invoice',
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget builderCompletePayment() {
    return Visibility(
      visible: !controller.data.isPurchased,
      child: Buttons.filled(
        width: double.infinity,
        onPressed: controller.moveToInvoice,
        child: const Text('Selesaikan Pembayaran'),
      ),
    );
  }
}
