import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/db/drugs/drugs_db.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_assets.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../helpers/validations.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../../../../widgets/search/search_bars.dart';
import '../../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(context),
      bottomSheet: builderBottomSheet(context),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text('Transaksi'),
      centerTitle: true,
    );
  }

  Widget builderBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          Flexible(child: builderSearch(context)),
          Expanded(child: builderListTransaction(context)),
        ],
      ),
    );
  }

  Widget builderSearch(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final height = context.mediaQuerySize.height;

    return Obx(
      () => SearchBars.popup(
        context: context,
        controller: controller.searchC,
        state: controller.search.value.isNotEmpty,
        isLoading: controller.isLoading.value,
        isShowEmpty: false,
        hintText: 'Cari Obat dan Tindakan',
        suggestions: controller.resultSearch
            .map(
              (element) => SearchFieldListItem(
                element.name,
                item: element,
                child: builderItemSearch(element, textTheme, theme),
              ),
            )
            .toList(),
        maxSuggestionBoxHeight: height / 3,
        onSuggestionTap: (searchField) async {
          final product = searchField.item;

          // cek product di dalam list
          final isHadProduct = controller.listItemChoice.firstWhereOrNull(
            (element) => element.name == product?.name,
          );

          if (isHadProduct == null) {
            if (product != null) {
              final state = await showDialogUnit(
                context: context,
                product: product,
                isEdit: false,
              );

              if (state!) {
                controller.addItem(product);
              }

              controller.clearUnit();
            }
          } else {
            Dialogs.alert(
              context: context,
              title: 'Perhatian',
              content: const Text('Anda telah memilih item ini sebelumnya'),
              actions: [
                Buttons.text(
                  onPressed: Get.back,
                  child: const Text('Tutup'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Row builderItemSearch(
    DrugsDB element,
    TextTheme textTheme,
    ThemeData theme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element.name,
                style: textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              AutoSizeText(
                '${TextHelper.formatRupiah(amount: element.price)} / ${element.unit}',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.primary,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Stok',
                style: textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.surface,
                ),
              ),
              AutoSizeText(
                '${element.stock}',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                  color: theme.colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget builderListTransaction(BuildContext context) {
    final textTheme = context.textTheme;

    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) {
          final item = controller.listItemChoice[index];
          return ListTile(
            title: Text(item.name),
            titleTextStyle: textTheme.titleMedium,
            subtitle: Text(
              '${item.amountUnit} ${item.unit} ${TextHelper.formatRupiah(amount: (item.amountUnit ?? 0) * item.price)}',
            ),
            subtitleTextStyle: textTheme.bodyMedium,
            trailing: PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Edit',
                  child: const Text('Edit'),
                  onTap: () async {
                    final state = await showDialogUnit(
                      context: context,
                      isEdit: true,
                      product: item,
                    );

                    if (state != null) {
                      if (state) {
                        controller.updateitem(
                          index: index,
                          product: item,
                        );
                      }
                    }
                  },
                ),
                PopupMenuItem(
                  value: 'Hapus',
                  child: const Text('Hapus'),
                  onTap: () async {
                    final state = await Dialogs.alert(
                      context: context,
                      title: 'Perhatian',
                      content: const Text(
                        'Apakah anda yakin ingin menghapus item ini?',
                      ),
                      icon: const Icon(Icons.delete_forever_rounded),
                    );

                    if (state != null) {
                      if (state) controller.removeItem(index);
                    }
                  },
                ),
              ],
              icon: const Icon(Icons.more_vert_rounded),
            ),
            contentPadding: EdgeInsets.zero,
          );
        },
        itemCount: controller.listItemChoice.length,
      ),
    );
  }

  Widget builderBottomSheet(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(ConstantsAssets.imgNoPhoto),
                    ),
                    title: Obx(
                      () {
                        if (controller.patient.value != null) {
                          return Row(
                            children: [
                              Text(
                                controller.patient.value!.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              IconButton(
                                onPressed: controller.moveToSearchPatient,
                                icon: const Icon(
                                  Icons.change_circle_rounded,
                                ),
                                enableFeedback: false,
                                padding: EdgeInsets.zero,
                                color: theme.colorScheme.primary,
                                iconSize: 21,
                              )
                            ],
                          );
                        } else {
                          return GestureDetector(
                            onTap: controller.moveToSearchPatient,
                            child: const Text('Pilih Penerima'),
                          );
                        }
                      },
                    ),
                    titleTextStyle: textTheme.titleMedium,
                    subtitle: Obx(
                      () => Text.rich(
                        TextSpan(
                          text: 'Total ',
                          style: textTheme.labelLarge,
                          children: [
                            TextSpan(
                              text: TextHelper.formatRupiah(
                                amount: controller.totalPrice.value,
                              ),
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: SharedTheme.bold,
                                color: context.theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Buttons.filled(
                  onPressed: () {},
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showDialogUnit({
    required BuildContext context,
    required bool isEdit,
    required DrugsDB product,
  }) async {
    final textTheme = context.textTheme;

    var title = '';
    if (isEdit) {
      title = 'Ubah';
      // set unit textfield
      controller.unitC.text = product.amountUnit.toString();
      controller.itemPrice.value = (product.amountUnit ?? 0) * product.price;
    } else {
      title = 'Tambah';
    }

    return Dialogs.alert(
      context: context,
      title: '$title ${product.name}',
      titleTextStyle: textTheme.titleMedium,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormFields.outlined(
            controller: controller.unitC,
            title: 'Unit',
            hintText: 'Masukkan Unit',
            isLabel: true,
            suffixText: product.unit,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            maxLines: 1,
            onChanged: (value) => controller.onChanged(value, product.price),
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) => Validation.formField(
              value: value,
              titleField: 'Unit',
              isNotZero: true,
              isNumericOnly: true,
              maxLengthChar: product.stock,
              messageMaxChar: 'Jumlah unit tidak boleh melebihi stok',
            ),
          ),
          const SizedBox(height: 12),
          Text('Stok : ${product.stock}'),
          Obx(
            () => Text(
              'Harga: ${TextHelper.formatRupiah(amount: controller.itemPrice.value)}',
            ),
          ),
        ],
      ),
    );
  }
}
