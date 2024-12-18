import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/modules/core/menu_registration/rj/views/widget/item_card_rj.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';

import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/modal/modals.dart';
import '../../../../widgets/textformfield/custom_textform_field.dart';
import '../controllers/rj_controller.dart';

class RJView extends GetView<RJController> {
  const RJView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builderBody(context),
      floatingActionButton: builderFAB(context),
    );
  }

  Widget builderBody(BuildContext context) {
    final width = context.mediaQuerySize.width;
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

            // var indexUmum = 0;
            // var indexSpesialisSaraf = 0;
            var queue = 0;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              itemBuilder: (context, index) {
                final item = data[index];
                //! poli hanya 1
                // final poli =
                //     item.poli.toString().toLowerCase().replaceAll(' ', '_');

                Widget builder;
                Widget content;

                //! queue masih akan di perbaiki nanti
                // switch (poli) {
                //   case 'umum':
                //     indexUmum = (index + 1);
                //     queue = indexUmum;
                //     break;
                //   case 'spesialis_saraf':
                //     indexSpesialisSaraf += 1;
                //     queue = indexSpesialisSaraf;
                //     break;
                //   default:
                // }

                // content card
                if (item.status == 'failed') {
                  content = const SizedBox.shrink();
                } else {
                  content = Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ItemCardRJ(
                      index: index,
                      queue: index + 1,
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
          onEmpty: Obx(
            () => builderResponse(
              context: context,
              icon: (controller.isFilter.value)
                  ? Icons.sentiment_dissatisfied_rounded
                  : Icons.sentiment_neutral_rounded,
              iconColor: theme.colorScheme.primary,
              descriptionText: (controller.isFilter.value)
                  ? 'Data pada filter yang dicari belum ada'
                  : 'Belum ada data yang didaftarkan hari ini',
              action: (controller.isFilter.value)
                  ? Buttons.filled(
                      width: width / 2,
                      onPressed: () {
                        if (controller.isFilter.value) {
                          _showFilter(context);
                        } else {
                          controller.fetchDataPatient();
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
          onError: (error) => builderResponse(
            context: context,
            icon: Icons.error_rounded,
            iconColor: theme.colorScheme.error,
            descriptionText: 'Error saat mengambil data',
            action: Buttons.filled(
              width: width / 2,
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
                  heroTag: 'newPatientRJTag',
                  onPressed: controller.moveToNewPatient,
                  label: const Text('Pasien Baru'),
                ),
                const SizedBox(height: 12),
                FloatingActionButton.extended(
                  heroTag: 'registPatientRJTag',
                  onPressed: () =>
                      controller.moveToSearchPatientOrAddDoctor(context),
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

  void _showFilter(BuildContext context) async {
    // final theme = context.theme;
    // controller.fetchDoctor(controller.currentTotalLimitDoctor.value);

    final state = await Modals.bottomSheet(
      context: context,
      isAction: true,
      startActionText: 'Reset Filter',
      startOnPressed: controller.clearFilter,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Obx(
          //   () { return
          Obx(
            () => CustomDropdownTypeFormField(
              // mode: Mode.form,
              title: 'Dokter',
              hintText: 'Semua Dokter',
              hintTextSearch: 'Cari Nama Dokter',
              selectedItem: controller.selectedDoctorFilter.value,
              items: controller.dataDoctor,
              // asyncItems: controller.fetchNewDoctor,
              itemAsString: (value) {
                final doctorName = value?.dokters?.gelar
                        ?.replaceFirst('*', value.nama ?? '') ??
                    '-';
                return doctorName;
              },
              // isDense: true,
              // isItemsCached: true,
              isShowSearchBox: true,
              onChanged: (value) => controller.onChangedDoctor(value),
              // constraints: const BoxConstraints(maxHeight: 200),
              // ),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: controller.dateFilterC,
            isReadOnly: true,
            title: 'Tanggal',
            // hintText: 'Pilih Tanggal',
            isFilled: false,
            // isDense: true,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.done,
            suffixIcon: const Icon(Icons.date_range_rounded),
            onTap: () async {
              final now = DateTime.now();
              final nextYear =
                  DateTime(now.add(const Duration(days: 365)).year);
              final date = await showDatePicker(
                context: context,
                initialDate: controller.selectedDateFilter.value,
                currentDate: now,
                firstDate: DateTime(2020),
                lastDate: nextYear,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );

              if (date != null) controller.setDateFilter(date);
            },
          ),
          const SizedBox(height: 21),
        ],
      ),
    );

    if (state != null && state) {
      controller.isFilter.value = true;
      // filter by dokter dan tanggal
      if (controller.selectedDoctorFilter.value != null) {
        controller.fetchDataPatientByFilter();
      } else {
        // filter tanggal aja
        controller.fetchDataPatient();
      }
    }
  }

  Widget builderResponse({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String descriptionText,
    required Widget action,
  }) {
    // final theme = context.theme;
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
}
