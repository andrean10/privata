import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/emr/controllers/search_action_controller.dart';

import '../../../../data/models/item/item_model.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/search/search_bars.dart';

class SearchActionDialog extends GetView<SearchActionController> {
  const SearchActionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(
          'Tambah ${controller.title}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Obx(
              () => SearchBars.build(
                context: context,
                controller: controller.searchC,
                hintText: 'Cari ${controller.title}',
                state: controller.search.value != null &&
                    controller.search.value!.isNotEmpty,
              ),
            ),
            const SizedBox(height: 16),
            builderResultSearch(textTheme),
          ],
        ),
      ),
      bottomSheet: builderBottomSheet(size: size, textTheme: textTheme),
    );
  }

  Widget builderResultSearch(TextTheme textTheme) {
    return Expanded(
      child: Obx(
        () {
          final filter = controller.search.value;

          return FutureBuilder(
            future: controller.getData(filter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.hasError && snapshot.error != null) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              // if (filter != null && snapshot.data!.isEmpty) {
              //   return const Center(
              //     child: Text('Data pasien tidak ada'),
              //   );
              // }

              if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data;

                if (data!.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => builderItem(
                      textTheme: textTheme,
                      data: data[index],
                    ),
                  );
                }
              }

              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }

  Widget builderItem({
    required TextTheme textTheme,
    required ItemModel data,
  }) {
    return ListTile(
      title: Text(data.title),
      titleTextStyle: textTheme.titleMedium,
      subtitle: Text('Rp. ${data.price}'),
      onTap: () => controller.addItem(data),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => (controller.listAction.isNotEmpty ||
                      controller.listDrugs.isNotEmpty)
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (context, index) {
                          late final ItemModel data;

                          if (controller.type == SearchType.action) {
                            data = controller.listAction[index];
                          }

                          if (controller.type == SearchType.drugs) {
                            data = controller.listDrugs[index];
                          }

                          return ListTile(
                            title: Text(data.title),
                            trailing: IconButton(
                              iconSize: 18,
                              onPressed: () {},
                              icon: const Icon(Icons.delete_rounded),
                            ),
                          );
                        },
                        itemCount: controller.type == SearchType.action
                            ? controller.listAction.length
                            : controller.listDrugs.length,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      'Rp. 0',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Buttons.filled(
                    onPressed: controller.backToEMR,
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
