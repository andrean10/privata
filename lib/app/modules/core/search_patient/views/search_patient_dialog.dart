import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../data/models/user/users_model.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/search/search_bars.dart';
import '../controllers/search_patient_controller.dart';

class SearchPatientDialog extends GetView<SearchPatientController> {
  const SearchPatientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(),
      body: Container(
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
      ),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      leading: const CloseButton(),
      title: const Text('Pasien'),
      centerTitle: true,
    );
  }

  Widget builderSearch(BuildContext context) {
    return Obx(
      () => SearchBars.build(
        context: context,
        controller: controller.searchC,
        hintText: 'Cari Pasien',
        state: controller.search.value.isNotEmpty,
      ),
    );
  }

  Widget builderResultSearch(TextTheme textTheme) {
    return Expanded(
      child: controller.obx(
        (state) {
          if (state != null) {
            return ListView.separated(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final item = state[index];

                return GestureDetector(
                  onTap: () => controller.backTo(item),
                  child: builderItem(
                    context: context,
                    user: item,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            );
          }

          return const SizedBox.shrink();
        },
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onEmpty: Center(
          child: Text(
            'Data pasien tidak ditemukan',
            style: textTheme.bodyLarge,
          ),
        ),
        onError: (error) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }

  Widget builderItem({
    required BuildContext context,
    required UsersModel user,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final height = context.mediaQuerySize.height;

    final timeNow = DateTime.now();
    final age = (timeNow.difference(user.birthDate).inDays / 365).round();

    return Cards.elevated(
      inPadding: EdgeInsets.zero,
      outPadding: EdgeInsets.zero,
      child: SizedBox(
        height: height / 8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      user.name,
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: SharedTheme.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          user.idEMR,
                          style: textTheme.bodyMedium,
                        ),
                        AutoSizeText(
                          user.numberPhone,
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: theme.colorScheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      '$age',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: SharedTheme.bold,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    AutoSizeText(
                      'Tahun',
                      style: textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
