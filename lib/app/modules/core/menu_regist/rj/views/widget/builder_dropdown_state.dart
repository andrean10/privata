// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:privata/app/modules/core/menu_regist/rj/controllers/rj_controller.dart';

import '../../../../../../../shared/shared_theme.dart';
import '../../../../../../data/models/rj/item_rj/item_rj_model.dart';
import '../../../../../../data/models/status/status_model.dart';
import '../../../../../../helpers/text_helper.dart';
import '../../../../../widgets/buttons/buttons.dart';
import '../../../../../widgets/dialog/dialogs.dart';
import '../../../../../widgets/snackbar/snackbar.dart';
import '../../../../../widgets/textformfield/text_form_fields.dart';

class BuilderDropdownState extends GetView<RJController> {
  final int index;
  final ItemRJModel item;
  final List<StatusModel> status;

  const BuilderDropdownState({
    super.key,
    required this.index,
    required this.item,
    required this.status,
  });

  DropdownMenuEntry<String> dropdownLoading({
    required String label,
    required bool isLoading,
  }) {
    return DropdownMenuEntry(
      value: '',
      label: label,
      labelWidget: Buttons.text(
        width: double.infinity,
        state: isLoading,
        onPressed: () {
          controller.currentTotalLimitDoctor.value += 10;
          controller.isLoadingMoreDoctor.value = true;
        },
        child: const Text(
          'Load More',
          style: TextStyle(fontSize: 12),
        ),
      ),
      enabled: false,
      // trailingIcon: const CircularProgressIndicator.adaptive(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    late List<StatusModel> statusFilter;
    late final StatusModel data;

    switch (item.status) {
      case 'succeed':
        data = status.firstWhere(
          (element) => element.value.toString().toLowerCase() == item.status,
        );

        statusFilter = [data];
        break;
      case 'engaged':
        data = status.firstWhere(
          (element) => element.value.toString().toLowerCase() == item.status,
        );

        statusFilter = [status.first, data, status.last];
        break;
      case 'booked':
        if (item.confirmed != null && item.confirmed!) {
          data = status.firstWhere(
            (element) => element.value.toString().toLowerCase() == 'confirmed',
          );
          statusFilter = status.getRange(2, 7).toList();
        } else {
          data = status.firstWhere(
            (element) => element.value.toString().toLowerCase() == 'pending',
          );

          statusFilter = status.where(
            (element) {
              final value = element.value.toLowerCase();
              return value == 'confirmed' ||
                  value == 'reschedule' ||
                  value == 'pending' ||
                  value == 'delete';
            },
          ).toList();
        }
        break;
      case 'waiting':
        data = status.firstWhere(
          (element) => element.value.toString().toLowerCase() == 'waiting',
        );

        statusFilter = status.where(
          (element) {
            final value = element.value.toLowerCase();
            return value == 'engaged' ||
                value == 'reschedule' ||
                value == 'waiting' ||
                value == 'delete';
          },
        ).toList();
        break;
      default:
        break;
    }

    return DropdownButton(
      value: data.value.toLowerCase(),
      hint: const Text('Pilih Status'),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      borderRadius: BorderRadius.circular(32),
      isExpanded: true,
      items: statusFilter.map(
        (status) {
          final isEnabled = status.value != data.value.toLowerCase();
          return DropdownMenuItem(
            value: status.value,
            enabled: isEnabled,
            child: Obx(
              () => controller.isLoadingChangeState.value &&
                      controller.idSelected.value == item.id
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      TextHelper.capitalizeEachWords(status.value) ?? '',
                      style: textTheme.bodyMedium?.copyWith(
                        color: status.color,
                        fontWeight: SharedTheme.semiBold,
                      ),
                    ),
            ),
          );
        },
      ).toList(),
      icon: (item.status != 'succeed')
          ? Obx(
              () => Icon(
                Icons.keyboard_arrow_down_rounded,
                color: (controller.isLoadingChangeState.value &&
                        controller.idSelected.value == item.id)
                    ? null
                    : data.color,
              ),
            )
          : const SizedBox.shrink(),
      underline: Container(),
      menuMaxHeight: 200,
      onChanged: (value) async {
        final result = await Dialogs.alert(
          context: context,
          title: 'Perhatian!',
          content: Text('Apakah anda yakin ingin mengubah status ke $value ?'),
        );

        if (result != null) {
          if (result) {
            switch (value) {
              case 'reschedule':
                Dialogs.alert(
                  context: context,
                  title: 'Reschedule Appointment',
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFields.outlined(
                        controller: controller.datePatientRescheduleC,
                        isReadOnly: true,
                        title: 'Tanggal*',
                        hintText: 'Pilih Tanggal',
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        suffixIcon: const Icon(Icons.date_range_rounded),
                        onTap: () async {
                          final now = DateTime.now();
                          final nextYear =
                              DateTime(now.add(const Duration(days: 365)).year);

                          final date = await showDatePicker(
                            context: context,
                            initialDate: controller.selectedDateReschedule,
                            currentDate: now,
                            firstDate: now,
                            lastDate: nextYear,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                          );

                          if (date != null) controller.setDateReschedule(date);
                        },
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () {
                          return TextFormFields.dropdown(
                            controller: controller.doctorC,
                            // focusNode: controller.doctorF,
                            title: 'Dokter*',
                            hintText: 'Pilih Dokter',
                            isExpanded: true,
                            isFilled: false,
                            isEnableSearch: true,
                            isLabel: true,
                            isDense: true,
                            menuHeight: 300,
                            items: controller.dataDoctor.map(
                              (item) {
                                if (item != null) {
                                  if (item.toLowerCase() == 'loading') {
                                    return dropdownLoading(
                                      label: 'Loading...',
                                      isLoading: true,
                                    );
                                  } else {
                                    return DropdownMenuEntry(
                                      value: item,
                                      label: item,
                                      labelWidget: Text(
                                        item,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      enabled: item !=
                                          controller.selectedDoctor.value,
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          (item ==
                                                  controller
                                                      .selectedDoctor.value)
                                              ? SharedTheme.successColor
                                              : null,
                                        ),
                                      ),
                                    );
                                  }
                                }

                                return const DropdownMenuEntry(
                                  value: '',
                                  label: 'Data dokter belum ada',
                                  labelWidget: Text(
                                    '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  enabled: false,
                                );
                              },
                            ).toList()
                              ..addIf(
                                !controller.isHasReachedMaxDoctor.value,
                                dropdownLoading(
                                  label: 'Memuat data...',
                                  isLoading:
                                      controller.isLoadingMoreDoctor.value,
                                ),
                              ),
                            onSelected: controller.setDoctor,
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormFields.outlined(
                        controller: controller.descReasonRescheduleC,
                        title: 'Alasan Reschedule*',
                        hintText: 'Misal dokter sedang sibuk',
                        keyboardType: TextInputType.multiline,
                      ),
                    ],
                  ),
                  textNo: 'Tutup',
                  textYes: 'Simpan',
                ).then(
                  (state) {
                    if (item.id != null) {
                      if (state!) {
                        controller.onChangedStatus(
                          value: value,
                          index: index,
                          id: item.id!,
                        );
                      }
                    } else {
                      Snackbar.failed(
                        context: context,
                        content: 'Tidak bisa melakukan aksi ini sekarang',
                      );
                    }
                  },
                );
                break;
              case 'delete':
                Dialogs.alert(
                  context: context,
                  title: 'Alasan membatalkan kunjungan',
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFields.dropdown(
                        controller: controller.reasonCancellationC,
                        title: 'Penyebab',
                        isExpanded: true,
                        isFilled: false,
                        isEnableSearch: true,
                        isLabel: true,
                        isDense: true,
                        items: ['pasien', 'klink']
                            .map(
                              (e) => DropdownMenuEntry(
                                value: e,
                                label:
                                    'Pihak ${TextHelper.capitalizeEachWords(e)}',
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                      TextFormFields.outlined(
                        controller: controller.descReasonCancellationC,
                        title: 'Keterangan',
                        hintText: 'Alasan Batal',
                        keyboardType: TextInputType.multiline,
                      ),
                    ],
                  ),
                  textNo: 'Tutup',
                  textYes: 'Simpan',
                ).then(
                  (state) {
                    if (item.id != null) {
                      if (state!) {
                        controller.onChangedStatus(
                          value: value,
                          index: index,
                          id: item.id!,
                        );
                      }
                    } else {
                      Snackbar.failed(
                        context: context,
                        content: 'Tidak bisa melakukan aksi ini sekarang',
                      );
                    }
                  },
                );

                break;
              default:
                controller.onChangedStatus(
                  value: value,
                  index: index,
                  id: item.id!,
                );
                break;
            }
          } else {
            controller.isLoadingChangeState.value = false;
          }
        }
      },
    );
  }
}
