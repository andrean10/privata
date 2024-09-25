import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/rme/controllers/rme_controller.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../widgets/card/cards.dart';

class TodayRmeScreen extends GetView<RmeController> {
  const TodayRmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        await Future.delayed(3000.ms);
      },
      child: builderBody(textTheme, theme),
    );
  }

  Widget builderBody(TextTheme textTheme, ThemeData theme) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      itemBuilder: (context, index) => builderItem(textTheme, theme),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(
                    () {
                      final data = ConstantsStrings.dataStatus.firstWhereOrNull(
                        (element) =>
                            element.value.toString() == controller.status.value,
                      );

                      return DropdownButton(
                        value: controller.status.value,
                        hint: const Text('Pilih Status'),
                        items: ConstantsStrings.dataStatus.map(
                          (item) {
                            return DropdownMenuItem(
                              value: item.value,
                              child: Text(
                                item.value,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: item.color,
                                  fontWeight: SharedTheme.semiBold,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: (data != null) ? data.color as Color : null,
                        ),
                        underline: Container(),
                        menuMaxHeight: 200,
                        onChanged: controller.onChangedStatus,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: controller.moveToEMR,
                    icon: Image.asset(
                      ConstantsAssets.icMedicalHistory,
                      width: 21,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
