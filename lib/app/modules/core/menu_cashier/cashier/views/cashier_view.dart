import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../../../../../../utils/constants_strings.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/cashier_controller.dart';

class CashierView extends GetView<CashierController> {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(context),
      body: builderBody(context, textTheme),
      floatingActionButton: builderFAB(),
    );
  }

  AppBar builderAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Kasir'),
      centerTitle: true,
      actions: [
        builderActionFilter(context),
      ],
    );
  }

  Widget builderActionFilter(BuildContext context) {
    return Buttons.text(
      onPressed: () {
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
                  controller: controller.dateC,
                  focusNode: controller.dateF,
                  isReadOnly: true,
                  title: 'Tanggal',
                  hintText: 'Pilih Tanggal',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );

                    if (date != null) controller.setDate(date);
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
                    onPressed: controller.filter,
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ).then((_) => controller.clearData());
      },
      child: const Text('Filter'),
    );
  }

  Widget builderBody(BuildContext context, TextTheme textTheme) {
    return NotificationListener<ScrollNotification>(
      onNotification: controller.onNotification,
      child: RefreshIndicator.adaptive(
        onRefresh: controller.fetchData,
        child: const Center(
          child: Text('Tidak ada data tranasksi hari ini'),
        ),
        // child: ListView.builder(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 8,
        //     vertical: 4,
        //   ),
        //   itemBuilder: (context, index) => builderItem(
        //     context: context,
        //     textTheme: textTheme,
        //     index: index,
        //   ).animate(target: controller.isLoading.value ? 0 : 1).shimmer(
        //         duration: 3000.ms,
        //       ),
        //   itemCount: 10,
        // ),
      ),
    );
  }

  Widget builderItem({
    required BuildContext context,
    required TextTheme textTheme,
    required int index,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Cards.elevated(
      // context: Get.context!,
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Tania Ramadhani',
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
                color: (index.isEven) ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                (index.isEven) ? 'Belum Lunas' : 'Lunas',
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              'Rp. 150.000',
              style: textTheme.labelLarge,
              minFontSize: textTheme.labelLarge?.fontSize ?? 14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            AutoSizeText(
              ConstantsStrings.dummy,
              maxLines: 3,
              minFontSize: textTheme.bodyMedium?.fontSize ?? 14,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget builderFAB() {
    return Obx(
      () => FloatingActionButton(
        onPressed: () => controller.moveToPage(false),
        child: const Icon(Icons.add_rounded),
      ).animate(target: controller.isFabVisible.value ? 0 : 1).moveX(
            begin: 0,
            end: 500,
            curve: Curves.easeInBack,
          ),
    );
  }
}
