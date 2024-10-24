import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/core/emr/controllers/search_action_controller.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';

import '../../../../data/db/item/item_model.dart';
import '../../../../data/models/procedure/procedure_model.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/search/search_bars.dart';

class SearchActionDialog extends GetView<SearchActionController> {
  const SearchActionDialog({super.key});

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
      title: Text(
        'Tambah ${controller.title}',
      ),
      centerTitle: true,
    );
  }

  Widget builderBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builderSearch(),
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
          builderResultSearch(context),
        ],
      ),
    );
  }

  Widget builderSearch() {
    return CustomDropdownTypeFormField(
      title: 'Cari ${controller.title}',
      hintText: 'Cari ${controller.title}',
      isLabel: true,
      isShowSearchBox: true,
      asyncItems: controller.searchProcedure,
      itemAsString: (value) => value.name ?? '-',
      onBeforeChange: (prevItem, nextItem) {
        if (nextItem != null) {
          controller.addProcedure(nextItem);
        }

        return Future.value(false);
      },
    );
  }

  Widget builderResultSearch(BuildContext context) {
    final textTheme = context.textTheme;

    return Expanded(
      child: Obx(
        () {
          final result = controller.resultProcedures;

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

  // Widget builderResultSearch(BuildContext context) {
  //   final textTheme = context.textTheme;

  //   return Expanded(
  //     child: Obx(
  //       () {
  //         final filter = controller.search.value;

  //         return FutureBuilder(
  //           future: controller.searchProcedure(filter),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const Center(
  //                 child: CircularProgressIndicator.adaptive(),
  //               );
  //             }

  //             if (snapshot.hasError && snapshot.error != null) {
  //               return Center(
  //                 child: Text(snapshot.error.toString()),
  //               );
  //             }

  //             // if (filter != null && snapshot.data!.isEmpty) {
  //             //   return const Center(
  //             //     child: Text('Data pasien tidak ada'),
  //             //   );
  //             // }

  //             if (snapshot.hasData && snapshot.data != null) {
  //               final data = snapshot.data;

  //               if (data!.isNotEmpty) {
  //                 return ListView.builder(
  //                   shrinkWrap: true,
  //                   itemCount: data.length,
  //                   itemBuilder: (context, index) => builderItem(
  //                     textTheme: textTheme,
  //                     data: data[index],
  //                   ),
  //                 );
  //               }
  //             }

  //             return const SizedBox.shrink();
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget builderItem({
    required TextTheme textTheme,
    required int index,
    required ProcedureModel data,
  }) {
    return ListTile(
      title: Text(data.name ?? '-'),
      titleTextStyle: textTheme.titleMedium,
      subtitle: Text(
        '${TextHelper.formatRupiah(
          amount: data.basicFee,
          isCompact: false,
        )}',
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
                          amount: controller.totalAmount.value) ??
                      'Rp. 0',
                  style: textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Buttons.filled(
              onPressed: controller.saveProcedures,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );

    // return BottomSheet(
    //   onClosing: () {},
    //   constraints: BoxConstraints.loose(const Size.fromHeight(300)),
    //   builder: (context) => Container(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 16,
    //       vertical: 12,
    //     ),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Obx(
    //           () => (controller.listAction.isNotEmpty ||
    //                   controller.listDrugs.isNotEmpty)
    //               ? Flexible(
    //                   child: ListView.builder(
    //                     shrinkWrap: true,
    //                     keyboardDismissBehavior:
    //                         ScrollViewKeyboardDismissBehavior.onDrag,
    //                     itemBuilder: (context, index) {
    //                       late final ItemModel data;

    //                       if (controller.type == SearchType.procedure) {
    //                         data = controller.listAction[index];
    //                       }

    //                       if (controller.type == SearchType.drugs) {
    //                         data = controller.listDrugs[index];
    //                       }

    //                       return ListTile(
    //                         title: Text(data.title),
    //                         trailing: IconButton(
    //                           iconSize: 18,
    //                           onPressed: () {},
    //                           icon: const Icon(Icons.delete_rounded),
    //                         ),
    //                       );
    //                     },
    //                     itemCount: controller.type == SearchType.procedure
    //                         ? controller.listAction.length
    //                         : controller.listDrugs.length,
    //                   ),
    //                 )
    //               : const SizedBox.shrink(),
    //         ),
    //         const SizedBox(height: 16),
    //         Flexible(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Expanded(
    //                 child: AutoSizeText(
    //                   'Rp. 0',
    //                   style: textTheme.titleLarge,
    //                 ),
    //               ),
    //               const SizedBox(width: 12),
    //               Buttons.filled(
    //                 onPressed: controller.backToEMR,
    //                 child: const Text('Simpan'),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
