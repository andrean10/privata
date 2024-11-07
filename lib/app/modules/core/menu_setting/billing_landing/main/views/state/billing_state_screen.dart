import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/menu_setting/billing_landing/main/controllers/billing_landing_controller.dart';
import 'package:privata/shared/shared_theme.dart';

import '../../../../../../../../shared/shared_enum.dart';
import '../../../../../../widgets/buttons/buttons.dart';
import '../../widget/builder_state_billing_system.dart';

class BillingStateScreen extends GetView<BillingLandingController> {
  const BillingStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        builderSubscriptionPackage(context),
        const SizedBox(height: 10),
        Expanded(
          child: builderHistoryTransaction(context),
        ),
      ],
    );
  }

  Widget builderSubscriptionPackage(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            'Clinica Pro',
            style: textTheme.labelLarge
                ?.copyWith(fontWeight: SharedTheme.semiBold),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 24,
            leading: const Icon(
              Icons.calendar_today_rounded,
              size: 24,
            ),
            title: Text(
              'Tanggal berakhir',
              style: textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
            subtitle: Text(
              '30 Oktober 2030',
              style: textTheme.bodyMedium,
            ),
            trailing: builderItemState(textTheme, theme),
          ),
          builderButtonPayOff(),
        ],
      ),
    );
  }

  Widget builderButtonPayOff() {
    return Obx(
      () => Visibility(
        visible: controller.state.value == BillingState.notyet,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Buttons.elevated(
              width: double.infinity,
              onPressed: () {},
              child: const Text('Lunasi Sekarang'),
            ),
          ],
        ),
      ),
    );
  }

  Widget builderItemState(TextTheme textTheme, ThemeData theme) {
    return Obx(
      () {
        final state = controller.state.value;
        var stateText = '';
        Color color;

        switch (state) {
          case BillingState.active:
            stateText = 'Aktif';
            color = (Get.isDarkMode)
                ? SharedTheme.darkSuccessColor
                : SharedTheme.lightSuccessColor;
          case BillingState.notyet:
            stateText = 'Belum Lunas';
            color = (Get.isDarkMode)
                ? SharedTheme.darkWarningColor
                : SharedTheme.lightWarningColor;
          case BillingState.inActive:
            stateText = 'Tidak Aktif';
            color = theme.colorScheme.error;
          default:
            stateText = '';
            color = theme.colorScheme.primary;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Status',
              style: textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
            const SizedBox(height: 4),
            Text(
              stateText,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: SharedTheme.semiBold,
                color: color,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget builderHistoryTransaction(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 44),
      color: theme.colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Riwayat Transaksi',
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: builderItemHistoryTrasaction(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Buttons.filled(
              width: double.infinity,
              icon: const Icon(Icons.add_rounded),
              child: const Text('Tambah Langganan'),
              onPressed: controller.moveToPackages,
            ),
          ),
        ],
      ),
    );
  }

  Widget builderItemHistoryTrasaction(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => controller.moveToDetailLanding(controller.data),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      '20 September 2022, 10:49',
                      style:
                          textTheme.bodySmall?.copyWith(color: theme.hintColor),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            'Clinica Pro 6 Bulan',
                            style: textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AutoSizeText(
                            'Rp 800.000',
                            style: textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Billing Sistem',
                          style: textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        const BuilderStateBillingSystem(isPaid: true),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
