import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/rme/controllers/rme_controller.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../widgets/card/cards.dart';
import 'widgets/item_card_rme.dart';

class TodayRmeScreen extends GetView<RmeController> {
  const TodayRmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        controller.fetchDataPatient(isRefresh: true);
      },
      child: builderBody(textTheme, theme),
    );
  }

  Widget builderBody(TextTheme textTheme, ThemeData theme) {
    return Obx(
      () {
        final appointments = controller.todayAppointment;

        var indexUmum = 0;
        // var queue = 0;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          itemBuilder: (context, index) {
            final item = appointments[index];
            final poli =
                item.poli.toString().toLowerCase().replaceAll(' ', '_');

            Widget builder;
            Widget content;

            switch (poli) {
              case 'umum':
                indexUmum = (index + 1);
                break;
              default:
            }

            // content card
            if (item.status == 'failed') {
              content = const SizedBox.shrink();
            } else {
              content = Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ItemCardRME(
                  index: index,
                  queue: indexUmum,
                  item: item,
                ),
              );
            }

            if (index == (appointments.length - 1)) {
              // loading or text max pagination
              builder = Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  content,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 21),
                    child: Obx(
                      () => Visibility(
                        replacement: (controller.isHasReachedMax.value &&
                                appointments.length > 5)
                            ? AutoSizeText(
                                'Page has reached maximum limit',
                                style: textTheme.labelSmall,
                              )
                            : const SizedBox.shrink(),
                        visible: controller.isLoadingMore.value,
                        child: const CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              builder = content;
            }

            return builder;
          },
          itemCount: appointments.length,
        );
      },
    );
  }

  Widget builderItem(TextTheme textTheme, ThemeData theme) {
    return InkWell(
      onTap: () {},
      child: Cards.elevated(
        inPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Azis, 30 Thn',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: SharedTheme.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: true,
                      child: Image.asset(
                        ConstantsAssets.icMedicaboo,
                        width: 21,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Badge.count(
                      count: 1,
                      largeSize: 21,
                      backgroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ],
                )
              ],
            ),
            Text(
              'MR0000000039, Laki-laki',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              '14 Agustus, (10:00 - 15:00)',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Dr. Saipul Jamil',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Obx(
            //         () {
            //           final data = ConstantsStrings.dataStatus.firstWhereOrNull(
            //             (element) =>
            //                 element.value.toString() == controller.status.value,
            //           );

            //           return DropdownButton(
            //             value: controller.status.value,
            //             hint: const Text('Pilih Status'),
            //             items: ConstantsStrings.dataStatus.map(
            //               (item) {
            //                 return DropdownMenuItem(
            //                   value: item.value,
            //                   child: Text(
            //                     item.value,
            //                     style: textTheme.bodyMedium?.copyWith(
            //                       color: item.color,
            //                       fontWeight: SharedTheme.semiBold,
            //                     ),
            //                   ),
            //                 );
            //               },
            //             ).toList(),
            //             icon: Icon(
            //               Icons.keyboard_arrow_down_rounded,
            //               color: (data != null) ? data.color : null,
            //             ),
            //             underline: Container(),
            //             menuMaxHeight: 200,
            //             onChanged: controller.onChangedStatus,
            //           );
            //         },
            //       ),
            //     ),
            //     Expanded(
            //       child: IconButton(
            //         onPressed: () => controller.moveToEMR(controller.appo),
            //         icon: Image.asset(
            //           ConstantsAssets.icMedicalHistory,
            //           width: 21,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
