import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/modules/core/menu_regist/rj/views/widget/item_card_rj.dart';
import 'package:privata/shared/shared_theme.dart';

import '../../../../widgets/buttons/buttons.dart';
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
                    child: ItemCardRJ(
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
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
                suffixIcon: const Icon(Icons.date_range_rounded),
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
