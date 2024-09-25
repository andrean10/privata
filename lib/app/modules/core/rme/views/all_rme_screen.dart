import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/core/rme/controllers/rme_controller.dart';
import 'package:privata/app/modules/widgets/search/search_bars.dart';

class AllRmeScreen extends GetView<RmeController> {
  const AllRmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          builderSearch(context),
          const SizedBox(height: 16),
          builderResultSearch(textTheme),
        ],
      ),
    );
  }

  Widget builderSearch(BuildContext context) {
    return SearchBars.build(
      context: context,
      controller: controller.searchC,
      hintText: 'Cari Pasien',
      state: controller.search.value != null &&
          controller.search.value!.isNotEmpty,
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

              if (filter != null && snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Data pasien tidak ada'),
                );
              }

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
    required String data,
  }) {
    return ListTile(
      title: Text(data),
      titleTextStyle: textTheme.titleMedium,
      subtitle: const Text('Laki-laki, 23-02-2009, KUUGA0000245'),
      onTap: controller.moveToTimelineEMR,
    );
  }
}
