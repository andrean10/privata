// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/doctor/doctor_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';

import 'package:privata/app/modules/core/menu_registration/rj/controllers/rj_controller.dart';

import '../../../../../../../shared/shared_theme.dart';
import '../../../../../../data/models/rj/item_rj/item_rj_model.dart';
import '../../../../../../data/models/slot/slot_model.dart';
import '../../../../../../data/db/status/status_model.dart';
import '../../../../../../helpers/helper.dart';
import '../../../../../../helpers/text_helper.dart';
import '../../../../../../helpers/validations.dart';
import '../../../../../widgets/buttons/buttons.dart';
import '../../../../../widgets/dialog/dialogs.dart';
import '../../../../../widgets/modal/modals.dart';
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
          // tambahkan currentlimit
          controller.currentTotalLimitDoctor.value += 10;
          controller.isLoadingMoreDoctor.value = true;
        },
        child: const Text(
          'Load More',
          style: TextStyle(fontSize: 12),
        ),
      ),
      enabled: false,
    );
  }

  List<DropdownMenuEntry<SlotModel?>> builderItemDropdownSlot({
    required bool isLoading,
    required List<SlotModel> data,
  }) {
    if (isLoading) {
      return [
        const DropdownMenuEntry(
          value: null,
          label: 'loading',
          labelWidget: Center(child: CircularProgressIndicator.adaptive()),
          enabled: false,
        )
      ];
    }

    if (data.isNotEmpty) {
      return controller.dataSlotDoctor.map(
        (item) {
          final startTime = FormatDateTime.time(value: item.start);
          final endTime = FormatDateTime.time(value: item.end);
          final timeFormat = '$startTime - $endTime WIB';

          return DropdownMenuEntry(
            value: item,
            label: timeFormat,
          );
        },
      ).toList();
    }

    return [
      const DropdownMenuEntry(
        value: null,
        label: 'Slot waktu belum ada',
        enabled: false,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
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
                controller
                    .fetchDoctor(controller.currentTotalLimitDoctor.value);

                Dialogs.fullScreen(
                  context: context,
                  title: 'Reschedule Appointment',
                  actions: [
                    Buttons.text(
                      onPressed: () {
                        if (item.id != null) {
                          controller.onChangedStatus(
                            index: index,
                            id: item.id!,
                            status: value,
                          );
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                  content: Form(
                    key: controller.formKeyReschedule,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormFields.outlined(
                          controller: controller.dateRescheduleC,
                          isReadOnly: true,
                          title: 'Tanggal*',
                          hintText: 'Pilih Tanggal',
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          suffixIcon: const Icon(Icons.date_range_rounded),
                          onTap: () async {
                            final now = DateTime.now();
                            final nextYear = DateTime(
                                now.add(const Duration(days: 365)).year);

                            final date = await showDatePicker(
                              context: context,
                              initialDate:
                                  controller.selectedDateReschedule.value,
                              currentDate: now,
                              firstDate: now,
                              lastDate: nextYear,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            );

                            if (date != null) {
                              controller.setDateReschedule(date);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        // TENAGA MEDIS
                        Obx(
                          () {
                            return TextFormFields.dropdown(
                              controller: controller.doctorRescheduleC,
                              title: 'Tenaga Medis*',
                              hintText: 'Pilih Tenaga Medis',
                              isExpanded: true,
                              isFilled: false,
                              isEnableSearch: true,
                              isLabel: true,
                              isDense: true,
                              menuHeight: 300,
                              items: controller.dataDoctor.map(
                                (item) {
                                  if (item != null) {
                                    if (controller.isLoadingDoctor.value) {
                                      return dropdownLoading(
                                        label: 'Loading...',
                                        isLoading: true,
                                      );
                                    } else {
                                      final doctorName = item.dokters?.gelar
                                              ?.replaceFirst(
                                                  '*', item.nama ?? '') ??
                                          '-';

                                      return DropdownMenuEntry(
                                        value: item,
                                        label: doctorName,
                                        labelWidget: Text(
                                          doctorName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        enabled: item.id !=
                                            controller
                                                .selectedIdDoctorReschedule
                                                .value,
                                        style: ButtonStyle(
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                            (item.id ==
                                                    controller
                                                        .selectedIdDoctorReschedule
                                                        .value)
                                                ? theme.colorScheme.surface
                                                : theme.colorScheme.onSurface,
                                          ),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                            (item.id ==
                                                    controller
                                                        .selectedIdDoctorReschedule
                                                        .value)
                                                ? theme.colorScheme.primary
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
                                  !controller.isHasReachedMaxDoctor.value &&
                                      controller.dataDoctor.length > 1,
                                  dropdownLoading(
                                    label: 'Memuat data...',
                                    isLoading:
                                        controller.isLoadingMoreDoctor.value,
                                  ),
                                ),
                              onSelected: (value) {
                                if (value is DoctorModel) {
                                  controller.setDoctorReschedule(
                                    id: value.id,
                                    value: value.dokters?.gelar?.replaceFirst(
                                            '*', value.nama ?? '') ??
                                        '-',
                                  );
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        // SLOT WAKTU
                        Obx(
                          () {
                            return TextFormFields.dropdown<SlotModel?>(
                              controller: controller.slotRescheduleC,
                              title: 'Slot*',
                              hintText: 'Pilih Slot Waktu',
                              isEnabled:
                                  controller.selectedIdDoctorReschedule.value !=
                                      null,
                              isExpanded: true,
                              isFilled: false,
                              isEnableSearch: false,
                              isLabel: true,
                              isDense: true,
                              menuHeight: 300,
                              items: builderItemDropdownSlot(
                                isLoading: controller.isLoadingSlot.value,
                                data: controller.dataSlotDoctor,
                              ),
                              onSelected: controller.setSlotReschedule,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Obx(
                                () => TextFormFields.outlined(
                                  controller: controller.timeRescheduleC,
                                  isReadOnly: true,
                                  title: 'Jam*',
                                  hintText: 'Pilih Jam',
                                  isEnable:
                                      controller.selectedSlotReschedule.value !=
                                          null,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.next,
                                  suffixIcon:
                                      const Icon(Icons.schedule_rounded),
                                  onTap: () async {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime:
                                          controller.selectedTimeReschedule,
                                      builder: (context, child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child!,
                                        );
                                      },
                                    );

                                    // check time must include beetween slot selected
                                    if (time != null) {
                                      final startTime =
                                          FormatDateTime.intToTime(controller
                                                  .selectedSlotReschedule
                                                  .value
                                                  ?.start ??
                                              0);
                                      final endTime = FormatDateTime.intToTime(
                                          controller.selectedSlotReschedule
                                                  .value?.end ??
                                              0);

                                      final isTimeInRange =
                                          Helper.isTimeInRange(
                                        startTime: startTime,
                                        endTime: endTime,
                                        selectedTime: time,
                                      );

                                      if (isTimeInRange) {
                                        controller.setTimeReschedule(time);
                                      } else {
                                        Snackbar.failed(
                                          context: context,
                                          content:
                                              'Jam yang dipilih tidak sesuai dengan rentang waktu slot',
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Obx(
                                () => TextFormFields.outlined(
                                  controller: controller.durationRescheduleC,
                                  title: 'Lama Durasi*',
                                  hintText: 'Misal 10',
                                  suffixText: 'Menit',
                                  keyboardType: TextInputType.number,
                                  isEnable:
                                      controller.selectedSlotReschedule.value !=
                                          null,
                                  validator: (value) {
                                    final maxDuration =
                                        controller.maxSlotReschedule;

                                    return Validation.formField(
                                      value: value,
                                      titleField: 'Lama durasi',
                                      isNotZero: true,
                                      isNumericOnly: true,
                                      maxLengthChar: maxDuration,
                                      messageMinChar:
                                          'Menit durasi tidak boleh kosong',
                                      messageMaxChar:
                                          'Melewati maksimal $maxDuration menit durasi',
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Obx(
                          () => TextFormFields.outlined(
                            controller: controller.descReasonRescheduleC,
                            focusNode: controller.descReasonRescheduleF,
                            title: 'Alasan Reschedule*',
                            hintText: 'Misal dokter sedang sibuk',
                            suffixIconState: controller
                                .descReasonReschedule.value.isNotEmpty,
                            keyboardType: TextInputType.multiline,
                            validator: (value) => Validation.formField(
                              value: value,
                              titleField: 'Alasan Reschedule',
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ).then(
                  (state) {
                    // jika reschedule ditutup
                    if (state != null) {
                      controller.clearRescheduleAppointment();
                    }
                  },
                );
                break;
              case 'delete':
                Modals.bottomSheet(
                  context: context,
                  isAction: true,
                  content: Form(
                    key: controller.formKeyCancel,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormFields.dropdown(
                          controller: controller.reasonCancellationC,
                          title: 'Penyebab',
                          isExpanded: false,
                          isFilled: false,
                          isEnableSearch: true,
                          isLabel: true,
                          isDense: true,
                          items: ['pasien', 'klinik']
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
                        Obx(
                          () => TextFormFields.outlined(
                            controller: controller.descReasonCancellationC,
                            suffixIconState:
                                controller.descReasonCancellation.isNotEmpty,
                            title: 'Keterangan',
                            hintText: 'Alasan Batal',
                            keyboardType: TextInputType.multiline,
                            validator: (value) => Validation.formField(
                              value: value,
                              titleField: 'Keterangan',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  startActionText: 'Tutup',
                  endActionText: 'Simpan',
                ).then(
                  (state) {
                    if (item.id != null) {
                      if (state != null && state) {
                        controller.onChangedStatus(
                          index: index,
                          id: item.id!,
                          status: value,
                        );
                      }
                    } else {
                      Snackbar.failed(
                        context: context,
                        content: 'Tidak bisa melakukan aksi ini sekarang',
                      );
                    }
                  },
                ).whenComplete(
                  () => controller.clearDeleteAppointment(),
                );
                break;
              default:
                controller.onChangedStatus(
                  index: index,
                  id: item.id!,
                  status: value,
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
