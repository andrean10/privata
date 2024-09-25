import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/data/models/rj/rj_model.dart';
import 'package:privata/app/data/models/status/status_model.dart';
import 'package:privata/app/helpers/helper.dart';
import 'package:privata/app/modules/widgets/card/cards.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../../helpers/format_date_time.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/rj_controller.dart';

class RJView extends GetView<RJController> {
  const RJView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: builderAppBar(context),
      body: builderBody(context),
      floatingActionButton: builderFAB(context),
    );
  }

  AppBar builderAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Pendaftaran'),
      centerTitle: true,
      actions: [
        builderActionFilter(context),
      ],
    );
  }

  Widget builderActionFilter(BuildContext context) {
    return Buttons.text(
      onPressed: () => showFilter(context),
      child: const Text('Filter'),
    );
  }

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

  void showFilter(BuildContext context) {
    controller.fetchDoctor(controller.currentTotalLimitDoctor.value);

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
          bottom: 16,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () {
                  return TextFormFields.dropdown(
                    controller: controller.doctorC,
                    // focusNode: controller.doctorF,
                    width: constraints.maxWidth,
                    title: 'Dokter',
                    hintText: 'Semua Dokter',
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
                              enabled: item != controller.selectedDoctor.value,
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  (item == controller.selectedDoctor.value)
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
                          isLoading: controller.isLoadingMoreDoctor.value,
                        ),
                      ),
                    onSelected: controller.setDoctor,
                  );
                },
              ),
              const SizedBox(height: 12),
              TextFormFields.outlined(
                controller: controller.datePatientC,
                isReadOnly: true,
                title: 'Tanggal',
                hintText: 'Pilih Tanggal',
                onTap: () async {
                  final now = DateTime.now();
                  final nextYear =
                      DateTime(now.add(const Duration(days: 365)).year);
                  final date = await showDatePicker(
                    context: context,
                    initialDate: controller.selectedDate.value,
                    currentDate: now,
                    firstDate: DateTime(2020),
                    lastDate: nextYear,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  );

                  if (date != null) controller.setDate(date);

                  // showCupertinoModalPopup<String?>(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) {
                  //     return Container(
                  //       height: 250,
                  //       color: CupertinoColors.systemBackground
                  //           .resolveFrom(context),
                  //       child: SafeArea(
                  //         top: false,
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Buttons.text(
                  //                   onPressed: controller.clearDate,
                  //                   child: const Text('Tutup'),
                  //                 ),
                  //                 Buttons.text(
                  //                   onPressed: Get.back,
                  //                   child: const Text('Pilih'),
                  //                 ),
                  //               ],
                  //             ),
                  //             const SizedBox(height: 8),
                  //             Expanded(
                  //               child: CupertinoDatePicker(
                  //                 use24hFormat: true,
                  //                 initialDateTime: DateTime.now(),
                  //                 mode: CupertinoDatePickerMode.date,
                  //                 maximumDate: DateTime.now(),
                  //                 onDateTimeChanged: controller.changedDate,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                },
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
                suffixIcon: const Icon(Icons.date_range_rounded),
              ),
              const SizedBox(height: 21),
              Buttons.filled(
                width: double.infinity,
                onPressed: () => controller.fetchDataPatient(isFromModal: true),
                child: const Text('Simpan'),
              ),
              const SizedBox(height: 12),
              Buttons.outlined(
                width: double.infinity,
                onPressed: controller.clearFilter,
                child: const Text('Reset Filter'),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget builderBody(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return NotificationListener<ScrollNotification>(
      onNotification: controller.onNotification,
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          controller.fetchDataPatient(isRefresh: true);
        },
        child: controller.obx(
          (state) {
            final data = state as List<ItemRJModel>;

            var indexUmum = 0;
            var indexSpesialisSaraf = 0;
            var queue = 0;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              itemBuilder: (context, index) {
                final item = data[index];
                final poli =
                    item.poli.toString().toLowerCase().replaceAll(' ', '_');

                Widget builder;
                Widget content;

                //! queue masih akan di perbaiki nanti
                switch (poli) {
                  case 'umum':
                    indexUmum = (index + 1);
                    queue = indexUmum;
                    break;
                  case 'spesialis_saraf':
                    indexSpesialisSaraf += 1;
                    queue = indexSpesialisSaraf;
                    break;
                  default:
                }

                // content card
                if (item.status == 'failed') {
                  content = const SizedBox.shrink();
                } else {
                  content = Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: builderItem(
                      context: context,
                      index: index,
                      queue: queue,
                      item: item,
                    ),
                  );
                }

                if (index == (data.length - 1)) {
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
                                    data.length > 5)
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
              itemCount: data.length,
            );
          },
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
          onEmpty: builderResponse(
            context: context,
            icon: Icons.info_rounded,
            iconColor: theme.colorScheme.primary,
            descriptionText: (controller.isFilter.value)
                ? 'Data pada filter yang dicari belum ada'
                : 'Belum ada data yang didaftarkan hari ini',
            action: Buttons.filled(
              onPressed: () {
                if (controller.isFilter.value) {
                  showFilter(context);
                } else {
                  controller.fetchDataPatient();
                }
              },
              child: Obx(
                () => Text(
                  (controller.isFilter.value) ? 'Ubah Filter' : 'Coba Lagi',
                ),
              ),
            ),
          ),
          onError: (error) => builderResponse(
            context: context,
            icon: Icons.error_rounded,
            iconColor: theme.colorScheme.error,
            descriptionText: 'Error saat mengambil data',
            action: Buttons.filled(
              onPressed: controller.fetchDataPatient,
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
    required int queue,
    required ItemRJModel item,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    final patient = item.pasiens;

    var gender = '-';

    if (patient?.gender != null) {
      gender = patient!.gender == 1 ? 'Laki-laki' : 'Perempuan';
    }

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
                  child: FittedBox(
                    child: builderDropdownState(
                      context: context,
                      index: index,
                      item: item,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: builderActionMedicall(
                    context: context,
                    item: item,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: builderActionOthers(
                    context: context,
                    item: item,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
          controller.moveToEMR(itemRJ: item);
        } else {
          Dialogs.alert(
              context: context,
              title: 'Peringatan',
              content: const Text('Hanya bisa isi status saat engage'),
              actions: [
                Dialogs.builderAction('Tutup', true),
              ]).then(
            (value) => Get.back(),
          );

          // showAdaptiveDialog(
          //   context: context,
          //   builder: (context) => AlertDialog.adaptive(
          //     icon: const Icon(
          //       Icons.warning_rounded,
          //       size: 32,
          //     ),
          //     title: const Text('Peringatan'),
          //     content: const Text('Hanya bisa isi status saat engage'),
          //     actions: [
          //       Buttons.text(
          //         onPressed: Get.back,
          //         child: const Text('Oke'),
          //       ),
          //     ],
          //   ),
          // );
        }
      },
      icon: Image.asset(
        ConstantsAssets.icMedicalHistory,
        width: 21,
      ),
    );
  }

  Widget builderActionOthers(
      {required BuildContext context, required ItemRJModel item}) {
    List<String> menu;

    if (item.status == 'succeed') {
      menu = ConstantsStrings.dataActions.take(3).toList();
    } else {
      menu = ConstantsStrings.dataActions;
    }

    return MenuAnchor(
      style: const MenuStyle(
        visualDensity: VisualDensity.comfortable,
      ),
      menuChildren: menu
          .map(
            (element) => MenuItemButton(
              child: Text(element),
              onPressed: () async {
                final numberPhone = item.pasiens?.phone;

                // Whatsapp
                if (element == menu.first) {
                  if (numberPhone != null && numberPhone != '') {
                    controller.makeToWhatsapp(numberPhone);
                  } else {
                    Snackbar.failed(
                      context: context,
                      content: 'Nomor pasien tersebut tidak ditemukan',
                    );
                  }
                } else if (element == menu[1]) {
                  // SMS
                  if (numberPhone != null && numberPhone != '') {
                    controller.makeToSMS(numberPhone);
                  } else {
                    Snackbar.failed(
                      context: context,
                      content: 'Nomor pasien tersebut tidak ditemukan',
                    );
                  }
                } else if (element == menu[2]) {
                  // Telepon
                  if (numberPhone != null && numberPhone != '') {
                    controller.makeToTelphone(numberPhone);
                  } else {
                    Snackbar.failed(
                      context: context,
                      content: 'Nomor pasien tersebut tidak ditemukan',
                    );
                  }
                }

                if (element == menu[3]) {
                  // Reschedule
                  controller.makeToReschedule();
                } else if (element == menu[4]) {
                  // Catatan Perawat
                  controller.makeToNurseNotes();
                } else if (element == menu.last) {
                  // Vital Sign
                  controller.makeToVitalSign();
                }
              },
            ),
          )
          .toList(),
      builder: (context, controller, child) => IconButton(
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        icon: const Icon(Icons.more_horiz_rounded),
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
          formatStartTime?.add(Duration(minutes: consultPlanDuration ?? 0));
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

  Widget builderDropdownState({
    required BuildContext context,
    required int index,
    required ItemRJModel item,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        // return Obx(
        //   () {

        final status = ConstantsStrings.dataStatus;

        late List<StatusModel> statusFilter;
        late StatusModel data;

        switch (item.status) {
          case 'succeed':
            data = status.firstWhere(
              (element) =>
                  element.value.toString().toLowerCase() == item.status,
            );

            statusFilter = [data];
            break;
          case 'engaged':
            data = status.firstWhere(
              (element) =>
                  element.value.toString().toLowerCase() == item.status,
            );

            statusFilter = [status.first, data, status.last];
            break;
          case 'booked':
            if (item.confirmed != null && item.confirmed!) {
              data = status.firstWhere(
                (element) =>
                    element.value.toString().toLowerCase() == 'confirmed',
              );
              statusFilter = status.getRange(2, 7).toList();
            } else {
              data = status.firstWhere(
                (element) =>
                    element.value.toString().toLowerCase() == 'pending',
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
          isDense: true,
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
              ? Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: data.color,
                )
              : const SizedBox.shrink(),
          underline: Container(),
          menuMaxHeight: 200,
          onChanged: (value) async {
            controller.isLoadingChangeState.value = true;

            final result = await Dialogs.alert(
              context: context,
              title: 'Perhatian!',
              content:
                  Text('Apakah anda yakin ingin mengubah status ke $value ?'),
            );

            if (result != null) {
              if (result) {
                switch (value) {
                  case 'delete':
                    // controller.changeDeletedStatus(id: item.id, index: index);
                    Dialogs.alert(
                      context: context,
                      title: 'Alasan membatalkan kunjungan',
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFields.dropdown(
                            controller: controller.reasonCancellationC,
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
                            // controller: TextEditingController(),
                            title: 'Keterangan',
                            hintText: 'Alasan Batal',
                            keyboardType: TextInputType.multiline,
                            // maxLines: 8,
                          ),
                        ],
                      ),
                      textNo: 'Tutup',
                      textYes: 'Simpan',
                    );

                    break;
                  default:
                }
              } else {
                controller.isLoadingChangeState.value = false;
              }
            }
          },
        );
      },
    );
  }

  Widget builderFAB(BuildContext context) {
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.extended(
                  onPressed: controller.moveToNewPatient,
                  label: const Text('Pasien Baru'),
                ),
                const SizedBox(height: 12),
                FloatingActionButton.extended(
                  onPressed: () => controller.moveToVisitRegistration(context),
                  label: const Text('Pendaftaran Kunjungan'),
                ),
                const SizedBox(height: 12),
              ],
            )
                .animate(target: controller.isSubFabVisible.value ? 0 : 1)
                .hide()
                .moveX(
                  begin: 0,
                  end: 500,
                  curve: Curves.easeInBack,
                ),
            FloatingActionButton(
              onPressed: controller.changedVisibleSubFab,
              child: const Icon(Icons.add_rounded)
                  .animate(target: controller.isSubFabVisible.value ? 1 : 0)
                  .rotate()
                  .swap(
                    builder: (context, child) =>
                        const Icon(Icons.close_rounded),
                  ),
            ),
          ],
        ).animate(target: controller.isFabVisible.value ? 0 : 1).moveX(
              begin: 0,
              end: 500,
              curve: Curves.easeInBack,
            );
      },
    );
  }

  Widget builderResponse({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String descriptionText,
    required Widget action,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.error,
            size: 38,
          ),
          const SizedBox(height: 4),
          AutoSizeText(
            descriptionText,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          action,
        ],
      ),
    );
  }
}
