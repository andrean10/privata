import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../helpers/validations.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../controllers/info_faskes_controller.dart';

class InfoFaskesView extends GetView<InfoFaskesController> {
  const InfoFaskesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(
        context: context,
        theme: theme,
        textTheme: textTheme,
      ),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text(ConstantsStrings.faskesInfo),
      centerTitle: true,
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert_rounded),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: ConstantsStrings.logout,
              child: const Text(ConstantsStrings.logout),
              onTap: () async {
                final result = await Dialogs.logout(context: context);

                if (result ?? false) {
                  await controller.logOut();
                }
              },
            )
          ],
          position: PopupMenuPosition.under,
        ),
      ],
    );
  }

  Widget builderBody({
    required BuildContext context,
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Cards.elevated(
            inPadding: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  builderUploadImage(
                    context: context,
                    theme: theme,
                  ),
                  const SizedBox(height: 24),
                  buiderFaskesName(),
                  const SizedBox(height: 16),
                  builderCheckOwner(),
                  builderCheckBpjs(),
                  const SizedBox(height: 16),
                  builderFaskesType(textTheme),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.filled(
                      controller: controller.addressNameC,
                      focusNode: controller.addressNameF,
                      title: 'Nama Jalan*',
                      // hintText: 'Misal Jalan Soekarno Hatta',
                      suffixIconState: controller.addressName.value.isNotEmpty,
                      isAutoCorrect: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      validator: (value) => Validation.formField(
                        value: value,
                        titleField: 'Nama jalan',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.dropdown(
                      controller: controller.provinceC,
                      focusNode: controller.provinceF,
                      title: 'Provinsi*',
                      items: controller.tempDataProvinces
                          .map(
                            (item) => DropdownMenuEntry(
                              value: item.id ?? '',
                              label: item.name ?? '',
                            ),
                          )
                          .toList(),
                      isExpanded: true,
                      textStyle: textTheme.titleMedium,
                      menuStyle: const MenuStyle(
                        maximumSize: WidgetStatePropertyAll(
                          Size.fromHeight(300),
                        ),
                      ),
                      onSelected: controller.selectedProvince,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.dropdown(
                      controller: controller.regenciesC,
                      focusNode: controller.regenciesF,
                      title: 'Kota*',
                      items: controller.tempDataRegencies
                          .map(
                            (item) => DropdownMenuEntry(
                              value: item.id ?? '',
                              label: item.name ?? '',
                            ),
                          )
                          .toList(),
                      isExpanded: true,
                      textStyle: textTheme.titleMedium,
                      isEnabled: controller.tempDataRegencies.isNotEmpty,
                      menuStyle: const MenuStyle(
                        maximumSize: WidgetStatePropertyAll(
                          Size.fromHeight(300),
                        ),
                      ),
                      onSelected: controller.selectedRegency,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.dropdown(
                      controller: controller.districtsC,
                      focusNode: controller.districtsF,
                      title: 'Kecamatan*',
                      items: controller.tempDataDistricts
                          .map(
                            (item) => DropdownMenuEntry(
                              value: item.id ?? '',
                              label: item.name ?? '',
                            ),
                          )
                          .toList(),
                      isExpanded: true,
                      textStyle: textTheme.titleMedium,
                      isEnabled: controller.tempDataDistricts.isNotEmpty,
                      menuStyle: const MenuStyle(
                        maximumSize: WidgetStatePropertyAll(
                          Size.fromHeight(300),
                        ),
                      ),
                      onSelected: controller.selectedDistrict,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.dropdown(
                      controller: controller.villagesC,
                      focusNode: controller.villagesF,
                      title: 'Kelurahan*',
                      items: controller.tempDataVillages
                          .map(
                            (item) => DropdownMenuEntry(
                              value: item.id ?? '',
                              label: item.name ?? '',
                            ),
                          )
                          .toList(),
                      isExpanded: true,
                      textStyle: textTheme.titleMedium,
                      isEnabled: controller.tempDataVillages.isNotEmpty,
                      menuStyle: const MenuStyle(
                        maximumSize: WidgetStatePropertyAll(
                          Size.fromHeight(300),
                        ),
                      ),
                      onSelected: controller.selectedVillage,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormFields.filled(
                      controller: controller.postalCodeC,
                      focusNode: controller.postalCodeF,
                      title: 'Kode POS*',
                      // hintText: 'Misal 12345',
                      suffixIconState: controller.postalCode.value.isNotEmpty,
                      isAutoCorrect: true,
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      validator: (value) => Validation.formField(
                        value: value,
                        titleField: 'Kode Pos',
                        isNumericOnly: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 21),
          Buttons.filled(
            width: double.infinity,
            onPressed: controller.confirm,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  Widget builderUploadImage({
    required BuildContext context,
    required ThemeData theme,
  }) {
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage(ConstantsAssets.imgDummyLogoClinic),
                minRadius: 40,
                maxRadius: 54,
              ),
              Positioned(
                right: 0,
                bottom: -4,
                child: IconButton.filled(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (context) {
                        return LayoutBuilder(builder: (context, constraints) {
                          final maxWidth = constraints.maxWidth;

                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                            ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    builderItemSource(
                                      width: maxWidth / 6,
                                      asset: ConstantsAssets.icGallery,
                                      title: 'Galeri',
                                      textTheme: textTheme,
                                      onPressed: () async {
                                        final data = await controller
                                            .pickFile(ImageSource.gallery);
                                        if (data != null) {
                                          final path = data.path;
                                        }
                                      },
                                    ),
                                    builderItemSource(
                                      width: maxWidth / 6,
                                      asset: ConstantsAssets.icCamera,
                                      title: 'Kamera',
                                      textTheme: textTheme,
                                      onPressed: () async {
                                        final data = await controller
                                            .pickFile(ImageSource.camera);
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
                  },
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: theme.colorScheme.surface,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        AutoSizeText(
          'Upload Logo Klinik',
          style: textTheme.labelLarge,
        ),
      ],
    );
  }

  Widget buiderFaskesName() {
    return Obx(
      () => TextFormFields.filled(
        controller: controller.faskesNameC,
        focusNode: controller.faskesNameF,
        title: 'Nama Faskes*',
        // hintText: 'Misal Klinik ABC',
        suffixIconState: controller.faskesName.value.isNotEmpty,
        isAutoCorrect: true,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama fasilitas kesehatan',
        ),
      ),
    );
  }

  Widget builderCheckOwner() {
    return Obx(
      () => CheckboxListTile.adaptive(
        value: controller.isOwner.value,
        onChanged: controller.changedOwner,
        title: const Text('Saya adalah owner'),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget builderCheckBpjs() {
    return Obx(
      () => CheckboxListTile.adaptive(
        value: controller.isApprovedBPJS.value,
        onChanged: controller.changedApprovedBPJS,
        contentPadding: EdgeInsets.zero,
        title: const Text('Faskes menerima pasien BPJS'),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget builderFaskesType(TextTheme textTheme) {
    return TextFormFields.dropdown(
      title: 'Tipe Faskes*',
      items: ConstantsStrings.faskesListType.indexed
          .map(
            (e) => DropdownMenuEntry(value: e.$1, label: e.$2),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      isExpanded: true,
    );
  }

  Widget builderItemSource({
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

}
