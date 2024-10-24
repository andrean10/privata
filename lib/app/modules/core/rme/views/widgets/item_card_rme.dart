import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/modules/core/rme/controllers/rme_controller.dart';

import '../../../../../../../shared/shared_theme.dart';
import '../../../../../../../utils/constants_assets.dart';
import '../../../../../../../utils/constants_strings.dart';
import '../../../../../helpers/format_date_time.dart';
import '../../../../../helpers/helper.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../../../menu_registration/rj/controllers/rj_controller.dart';
import '../../../menu_registration/rj/views/widget/builder_dropdown_state.dart';

class ItemCardRME extends GetView<RmeController> {
  final int index;
  final int queue;
  final ItemRJModel item;

  const ItemCardRME({
    super.key,
    required this.index,
    required this.queue,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final patient = item.pasiens;
    var gender = '-';

    if (patient?.gender != null) {
      gender = patient!.gender == 1 ? 'Laki-laki' : 'Perempuan';
    }

    return Cards.elevated(
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
                  '${patient?.nama}, ${Helper.getAge(patient?.tanggalLahir)} Thn',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: item.isMedicaboo ?? false,
                    child: Image.asset(
                      ConstantsAssets.icMedicaboo,
                      width: 21,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Badge.count(
                    count: queue,
                    largeSize: 21,
                    backgroundColor: theme.colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ],
              )
            ],
          ),
          Text(
            '${patient?.ph?.first.code}, $gender',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          builderTextDate(
            textTheme: textTheme,
            item: item,
          ),
          const SizedBox(height: 2),
          builderTextDoctor(
            textTheme: textTheme,
            item: item,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BuilderDropdownState(
                  index: index,
                  item: item,
                  status: ConstantsStrings.dataStatus,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: builderActionMedicall(
                  context: context,
                  item: item,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget builderTextDate({
    required TextTheme textTheme,
    required ItemRJModel item,
  }) {
    final poli = item.poli;
    var dateTime = '-';

    if (poli == 'Gawat Darurat' || poli == 'UGD') {
      dateTime = FormatDateTime.dateToString(
        newPattern: 'dd MMMM',
        value: item.date,
      );
    } else {
      var estimateTime = item.estimateTime.toString();
      final consultPlanDuration = int.parse('${item.consultPlanDuration ?? 0}');

      estimateTime = switch (estimateTime.length) {
        1 => '000$estimateTime',
        2 => '00$estimateTime',
        3 => '0$estimateTime',
        _ => estimateTime,
      };

      final date = FormatDateTime.dateToString(
        newPattern: 'dd MMMM',
        value: item.date,
      );

      final hour = estimateTime.substring(0, 2);
      final minute = estimateTime.substring(2, 4);
      final startTime = "$hour:$minute";

      //* FORMAT START TIME TO DATE TIME
      final formatStartTime = FormatDateTime.stringToDateTime(
        oldPattern: 'HH:mm',
        newPattern: 'HH:mm',
        value: startTime,
      );

      //* ADD TIME CONSULT TO START TIME
      final addStartTime =
          formatStartTime?.add(Duration(minutes: consultPlanDuration));
      final endTime = FormatDateTime.dateToString(
        newPattern: 'HH:mm',
        value: addStartTime.toString(),
      );

      dateTime = '$date, ($startTime - $endTime)';
    }

    return Text(
      dateTime,
      style: textTheme.bodyMedium,
    );
  }

  Widget builderTextDoctor({
    required TextTheme textTheme,
    required ItemRJModel item,
  }) {
    return Text(
      item.doctorName ?? '-',
      style: textTheme.bodyMedium,
    );
  }

  Widget builderActionMedicall({
    required BuildContext context,
    required ItemRJModel item,
  }) {
    return IconButton(
      onPressed: () {
        if (item.status == RJStatus.succeed.name) {
          controller.moveToTimeline(item);
        } else if (item.status == RJStatus.engaged.name) {
          controller.moveToEMR(item);
        } else {
          Dialogs.alert(
              context: context,
              title: 'Peringatan',
              content: const Text('Hanya bisa isi status saat engage'),
              actions: [
                Dialogs.builderAction(textButton: 'Tutup', result: true),
              ]).then(
            (value) => Get.back(),
          );
        }
      },
      icon: Image.asset(
        ConstantsAssets.icMedicalHistory,
        width: 21,
      ),
    );
  }
}