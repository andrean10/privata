import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/modules/core/rme/views/rme_view.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../../../utils/constants_strings.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/modal/modals.dart';
import '../../../widgets/textformfield/custom_dropdown_type_form_field.dart';
import '../../../widgets/textformfield/custom_textform_field.dart';
import '../../../widgets/textformfield/text_form_fields.dart';
import '../../menu_cashier/cashier/views/cashier_view.dart';
import '../../menu_dashboard/dashboard/views/dashboard_view.dart';
import '../../menu_setting/main/views/setting_view.dart';
import '../../menu_registration/rj/views/rj_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: builderAppBar(context),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            DashboardView(),
            RJView(),
            RmeView(),
            CashierView(),
            ProfileView(),
          ],
        ),
      ),
      drawer: builderDrawer(context),
    );
  }

  Widget builderDrawer(BuildContext context) {
    final textTheme = context.textTheme;

    return Obx(
      () => NavigationDrawer(
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.setDestination,
        children: [
          Stack(
            children: [
              Image.asset(
                ConstantsAssets.imgDummyClinicHeader,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black26,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _showChangePicture(context),
                        child: builderPicture(context),
                      ),
                      const SizedBox(height: 2),
                      AutoSizeText(controller.email ?? '-'),
                      AutoSizeText(
                        controller.name ?? '-',
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          ...controller.menu.take(4).map(
                (item) => NavigationDrawerDestination(
                  icon: Image.asset(
                    item.iconAsset!,
                    width: 21,
                  ),
                  label: Text(item.label),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 4, 21, 4),
            child: Divider(),
          ),
          NavigationDrawerDestination(
            icon: Image.asset(
              controller.menu.last.iconAsset!,
              width: 21,
            ),
            label: Text(controller.menu.last.label),
          )
        ],
      ),
    );
  }

  AppBar builderAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => controller.scaffoldKey.currentState?.openDrawer(),
        icon: const Icon(Icons.sort_rounded),
      ),
      title: Obx(
        () => Text(controller.menu[controller.currentIndex.value].label),
      ),
      actions: [
        _builderAction(context),
      ],
    );
  }

  Widget builderPicture(BuildContext context) {
    final theme = context.theme;

    return Stack(
      children: [
        const CircleAvatar(
          foregroundImage: AssetImage(ConstantsAssets.imgDummyLogoClinic),
          radius: 26,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.secondaryContainer,
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.edit_rounded,
              size: 12,
              color: theme.colorScheme.secondary,
            ),
          ),
          // child: IconButton.filled(
          //   iconSize: 14,
          //   visualDensity: VisualDensity.comfortable,
          //   style: ButtonStyle(
          //     side: WidgetStatePropertyAll(
          //       BorderSide(
          //         color: theme.colorScheme.surface,
          //         width: 3,
          //       ),
          //     ),
          //   ),
          //   onPressed: () => _showChangePicture(context),
          //   icon: Icon(
          //     Icons.edit_rounded,
          //     color: theme.colorScheme.surface,
          //   ),
          //   tooltip: 'Ubah Foto',
          // ),
        ),
      ],
    );
  }

  // PENDAFTARAN ACTIONS
  Widget _builderAction(BuildContext context) {
    return Obx(
      () => switch (controller.currentIndex.value) {
        1 || 3 => Buttons.text(
            onPressed: () {
              if (controller.currentIndex.value == 1) {
                _showFilterRJ(context);
              }

              if (controller.currentIndex.value == 3) {
                _showFilterCashier(context);
              }
            },
            child: const Text('Filter'),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  void _showChangePicture(BuildContext context) {
    final textTheme = context.textTheme;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return LayoutBuilder(builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  'Pilih Opsi',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
                const SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _builderItemSource(
                      width: maxWidth / 7,
                      asset: ConstantsAssets.icGallery,
                      title: 'Galeri',
                      textTheme: textTheme,
                      onPressed: () async {
                        final data =
                            await controller.pickFile(ImageSource.gallery);
                        if (data != null) {
                          final path = data.path;
                        }
                      },
                    ),
                    _builderItemSource(
                      width: maxWidth / 7,
                      asset: ConstantsAssets.icCamera,
                      title: 'Kamera',
                      textTheme: textTheme,
                      onPressed: () async {
                        final data =
                            await controller.pickFile(ImageSource.camera);
                        if (data != null) {
                          final path = data.path;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _builderItemSource({
    required double width,
    required String asset,
    required String title,
    required TextTheme textTheme,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            width: width,
          ),
          const SizedBox(height: 12),
          AutoSizeText(
            title,
            style: textTheme.labelLarge,
          ),
        ],
      ),
    );
  }

  void _showFilterRJ(BuildContext context) async {
    final state = await Modals.bottomSheet(
      context: context,
      isAction: true,
      startActionText: 'Reset Filter',
      startOnPressed: controller.rjC.clearFilter,
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
              selectedItem: controller.rjC.selectedDoctorFilter.value,
              items: controller.rjC.dataDoctor,
              // asyncItems: controller.rjC. fetchNewDoctor,
              itemAsString: (value) {
                final doctorName = value?.dokters?.gelar
                        ?.replaceFirst('*', value.nama ?? '') ??
                    '-';
                return doctorName;
              },
              // isDense: true,
              // isItemsCached: true,
              isShowSearchBox: true,
              onChanged: (value) => controller.rjC.onChangedDoctor(value),
              // constraints: const BoxConstraints(maxHeight: 200),
              // ),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: controller.rjC.dateFilterC,
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
                initialDate: controller.rjC.selectedDateFilter.value,
                currentDate: now,
                firstDate: DateTime(2020),
                lastDate: nextYear,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );

              if (date != null) controller.rjC.setDateFilter(date);
            },
          ),
          const SizedBox(height: 21),
        ],
      ),
    );

    if (state != null && state) {
      controller.rjC.isFilter.value = true;
      // filter by dokter dan tanggal
      if (controller.rjC.selectedDoctorFilter.value != null) {
        controller.rjC.fetchDataPatientByFilter();
      } else {
        // filter tanggal aja
        controller.rjC.fetchDataPatient();
      }
    }
  }

  void _showFilterCashier(BuildContext context) {
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
              controller: controller.cashierC.startDateC,
              focusNode: controller.cashierC.startDateF,
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

                if (date != null) controller.cashierC.setDate(date, true);
              },
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.done,
              suffixIcon: const Icon(Icons.date_range_rounded),
            ),
            const SizedBox(height: 16),
            TextFormFields.outlined(
              controller: controller.cashierC.endDateC,
              focusNode: controller.cashierC.endDateF,
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

                if (date != null) controller.cashierC.setDate(date, false);
              },
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.done,
              suffixIcon: const Icon(Icons.date_range_rounded),
            ),
            const SizedBox(height: 21),
            Obx(
              () => Buttons.filled(
                width: double.infinity,
                state: controller.cashierC.isLoading.value,
                onPressed: () =>
                    controller.cashierC.fetchCashier(isFilter: true),
                child: const Text(ConstantsStrings.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
