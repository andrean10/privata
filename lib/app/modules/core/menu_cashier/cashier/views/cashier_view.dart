import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/models/cashier/cashier_model.dart';

import '../../../../../../utils/constants_strings.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/cashier_controller.dart';

class CashierView extends GetView<CashierController> {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builderBody(context),
      // floatingActionButton: builderFAB(),
    );
  }

  Widget builderBody(BuildContext context) {
    final width = context.mediaQuerySize.width;
    final theme = context.theme;

    return NotificationListener<ScrollNotification>(
      onNotification: controller.onNotification,
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          controller.fetchCashier();
        },
        child: controller.obx(
          (state) => ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            itemBuilder: (context, index) => builderItem(
              context: context,
              index: index,
              data: state[index],
            ),
            itemCount: state!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
          onEmpty: Obx(
            () => _builderResponse(
              context: context,
              icon: (controller.isFilter.value)
                  ? Icons.sentiment_dissatisfied_rounded
                  : Icons.sentiment_neutral_rounded,
              iconColor: theme.colorScheme.primary,
              descriptionText: (controller.isFilter.value)
                  ? 'Data Transaksi pada filter yang dicari belum ada'
                  : 'Belum ada data transaksi hari ini',
              action: (controller.isFilter.value)
                  ? Buttons.filled(
                      width: width / 2,
                      onPressed: () {
                        if (controller.isFilter.value) {
                          _showFilter(context);
                        } else {
                          controller.fetchCashier();
                        }
                      },
                      child: Obx(
                        () => Text(
                          (controller.isFilter.value)
                              ? 'Ubah Filter'
                              : 'Coba Lagi',
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          onError: (error) => _builderResponse(
            context: context,
            icon: Icons.error_rounded,
            iconColor: theme.colorScheme.error,
            descriptionText: 'Error saat mengambil data transaksi',
            action: Buttons.filled(
              width: width / 2,
              onPressed: controller.fetchCashier,
              child: const Text('Coba Lagi'),
            ),
          ),
        ),
      ),
    );
  }

  Widget builderItem({
    required BuildContext context,
    required int index,
    required CashierModel data,
  }) {
    final textTheme = context.textTheme;
    final nama = data.patients?.nama;
    final items = data.items;
    final info = items?.mapMany((item) => [item.name ?? '-']).join(', ');
    // check harga per items
    final totalPrice = items?.fold(
      0,
      (previousValue, element) {
        final baseFee = element.baseFee;
        final totalFee = element.totalFee;
        final quantity = element.quantity ?? 0;

        if (baseFee != null) {
          return previousValue + (baseFee * quantity);
        }

        if (totalFee != null) {
          return previousValue + (totalFee * quantity);
        }

        return previousValue;
      },
    );

    return Cards.elevated(
      inPadding: EdgeInsets.zero,
      child: ListTile(
        onTap: () {
          final newData = data.copyWith.call(
            fixTotalFee: totalPrice,
          );
          controller.moveToPaymentDetail(
            isPaid: data.status == 'paid off',
            index: index,
            itemData: newData,
          );
        },
        isThreeLine: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                nama ?? '-',
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: (data.status == 'paid off') ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                (data.status == 'paid off') ? 'Lunas' : 'Belum Lunas',
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            AutoSizeText(
              info ?? '-',
              maxLines: 3,
              minFontSize: textTheme.bodyMedium?.fontSize ?? 14,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            AutoSizeText(
              TextHelper.formatRupiah(
                amount: totalPrice,
                isCompact: false,
              ),
              style: textTheme.labelLarge,
              minFontSize: textTheme.labelLarge?.fontSize ?? 14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
    );
  }

  // Widget builderFAB() {
  //   return Obx(
  //     () => FloatingActionButton(
  //       heroTag: 'cashierTag',
  //       onPressed: controller.moveToAddTransaction,
  //       child: const Icon(Icons.add_rounded),
  //     ).animate(target: controller.isFabVisible.value ? 0 : 1).moveX(
  //           begin: 0,
  //           end: 500,
  //           curve: Curves.easeInBack,
  //         ),
  //   );
  // }

  Widget _builderResponse({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String descriptionText,
    required Widget action,
  }) {
    final textTheme = context.textTheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 38,
          ),
          const SizedBox(height: 12),
          AutoSizeText(
            descriptionText,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 21),
          action,
        ],
      ),
    );
  }

  void _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      builder: (context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 21,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFields.outlined(
              controller: controller.startDateC,
              focusNode: controller.startDateF,
              isReadOnly: true,
              title: 'Dari Tanggal',
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );

                if (date != null) controller.setDate(date, true);
              },
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.done,
              suffixIcon: const Icon(Icons.date_range_rounded),
            ),
            const SizedBox(height: 16),
            TextFormFields.outlined(
              controller: controller.endDateC,
              focusNode: controller.endDateF,
              isReadOnly: true,
              title: 'Sampai Tanggal',
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );

                if (date != null) controller.setDate(date, false);
              },
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.done,
              suffixIcon: const Icon(Icons.date_range_rounded),
            ),
            const SizedBox(height: 21),
            Obx(
              () => Buttons.filled(
                width: double.infinity,
                state: controller.isLoading.value,
                onPressed: () => controller.fetchCashier(isFilter: true),
                child: const Text(ConstantsStrings.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
