import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/core/emr/controllers/search_procedure_controller.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../data/models/detail_rj/procedure/item_procedure/item_procedure_model.dart';

import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/search/search_bars.dart';

class SearchProcedureDialog extends GetView<SearchProcedureController> {
  const SearchProcedureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(context),
      bottomSheet: builderBottomSheet(size: size, textTheme: textTheme),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      leading: const CloseButton(),
      title: const Text('Tambah Tindakan'),
      centerTitle: true,
    );
  }

  Widget builderBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builderSearch(context),
          // Obx(
          //   () => SearchBars.build(
          //     context: context,
          //     controller: controller.searchC,
          //     hintText: 'Cari ${controller.title}',
          //     state: controller.search.value != null &&
          //         controller.search.value!.isNotEmpty,
          //   ),
          // ),
          const SizedBox(height: 16),
          builderSelectedProcedures(context),
        ],
      ),
    );
  }

  Widget builderSearch(BuildContext context) {
    return Obx(
      () {
        final procedures = controller.listProcedures.value;

        return SearchBars.popup(
          context: context,
          controller: controller.searchC,
          focusNode: controller.searchF,
          hintText: 'Cari Tindakan',
          suggestions: procedures
              .map(
                (e) => SearchFieldListItem(
                  '${e.name}',
                  child: Text(e.name ?? '-'),
                  item: e,
                ),
              )
              .toList(),
          onTap: () {
            if (procedures.isEmpty) {
              controller.fetchProcedures('');
            }
          },
          onSearchTextChanged: controller.filterProcedures,
          onSuggestionTap: controller.selectedItem,
          state: false,
          isLoading: procedures.isEmpty,
          isShowEmpty: procedures.isEmpty,
        );
      },
    );
  }

  Widget builderSelectedProcedures(BuildContext context) {
    final textTheme = context.textTheme;

    return Expanded(
      child: Obx(
        () {
          final result = controller.selectedProcedures;

          return ListView.builder(
            itemBuilder: (context, index) => builderItem(
              index: index,
              textTheme: textTheme,
              data: result[index],
            ),
            itemCount: result.length,
          );
        },
      ),
    );
  }

  Widget builderItem({
    required TextTheme textTheme,
    required int index,
    required ItemProcedureModel data,
  }) {
    return ListTile(
      title: Text(data.name ?? '-'),
      titleTextStyle: textTheme.titleMedium,
      subtitle: Text(
        TextHelper.formatRupiah(
          amount: data.basicFee,
          isCompact: false,
        ),
      ),
      trailing: IconButton(
        onPressed: () => controller.deleteProcedure(index),
        icon: const Icon(Icons.delete_rounded),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget builderBottomSheet({
    required Size size,
    required TextTheme textTheme,
  }) {
    return BottomSheet(
      onClosing: () {},
      constraints: BoxConstraints.loose(const Size.fromHeight(300)),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => AutoSizeText(
                  TextHelper.formatRupiah(
                          amount: controller.totalAmount.value),
                  style: textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => Buttons.filled(
                onPressed: controller.selectedProcedures.isNotEmpty ||
                        controller.isLoading.value
                    ? controller.saveProcedures
                    : null,
                state: controller.isLoading.value,
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
