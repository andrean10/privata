import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/detail_rj/detail_rj_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';

import '../../../../../../shared/shared_theme.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../controllers/timeline_emr_controller.dart';

class TimelineEmrView extends GetView<TimelineEmrController> {
  const TimelineEmrView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: builderAppBar(textTheme),
      body: builderBody(context),
    );
  }

  AppBar builderAppBar(TextTheme textTheme) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Timeline EMR',
            style: TextStyle(fontSize: 18),
          ),
          AutoSizeText(
            '${controller.name}, ${controller.age}, ${controller.gender}',
            style: textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            minFontSize: 10,
          ),
        ],
      ),
    );
  }

  Widget builderBody(BuildContext context) {
    final width = context.mediaQuerySize.width;
    final theme = context.theme;
    final textTheme = context.textTheme;

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        controller.fetchTimeline();
      },
      child: controller.obx(
        (state) => builderTimelines(
          context: context,
          state: state,
        ),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        onEmpty: Center(
          child: Text(
            'Data timeline tidak ditemukan',
            style: textTheme.bodyLarge,
          ),
        ),
        onError: (error) => builderResponse(
          context: context,
          icon: Icons.error_rounded,
          iconColor: theme.colorScheme.error,
          descriptionText: 'Error saat mengambil data',
          action: Buttons.filled(
            width: width / 2,
            onPressed: controller.fetchTimeline,
            child: const Text('Coba Lagi'),
          ),
        ),
      ),
    );
  }

  Widget builderTimelines({
    required BuildContext context,
    required List<DetailRJModel>? state,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      itemBuilder: (context, index) {
        const na = 'N/A';
        final item = state[index];
        final appointment = item.appointments;
        final doctorNotes = item.doctorNotes;
        final subjective = doctorNotes?.firstOrNull?.subjective?.join(',\n');
        final objective = doctorNotes?.firstOrNull?.objective;
        final assessment = doctorNotes?.firstOrNull?.assessment?.join(',\n');
        final plans = doctorNotes?.firstOrNull?.plan?.join();

        return Cards.filled(
          context: context,
          inPadding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: theme.colorScheme.primary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      FormatDateTime.dateToString(
                        newPattern: 'dd MMMM yyyy',
                        value: appointment?.appDate,
                      ),
                      style: textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      'Konsul dengan ${appointment?.doctorName ?? '-'}',
                      style: textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      'Subjective',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: SharedTheme.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: AutoSizeText(
                        (subjective != null && subjective.isNotEmpty)
                            ? subjective
                            : na,
                        style: textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      'Objective',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: SharedTheme.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: _builderItemObjective(
                        textTheme: textTheme,
                        objective: objective,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      'Assessment',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: SharedTheme.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: AutoSizeText(
                        (assessment != null && assessment.isNotEmpty)
                            ? assessment
                            : na,
                        style: textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      'Plan',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: SharedTheme.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: AutoSizeText(
                        (plans != null && plans.isNotEmpty) ? plans : na,
                        style: textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: state!.length,
    );
  }

  Widget _builderItemObjective({
    required TextTheme textTheme,
    required List<String>? objective,
  }) {
    if (objective != null && objective.isNotEmpty) {
      const na = 'N/A';
      final mappingObjectives = objective.asMap().map(
            (key, value) => MapEntry(
              key,
              '${switch (key) {
                0 => 'Laju Pernapasan',
                1 => 'Denyut Nadi',
                2 => 'Tinggi Badan',
                3 => 'Berat Badan',
                4 => 'Gula Darah',
                5 => 'Suhu Tubuh',
                6 => 'Lingkar Perut',
                7 => 'Saturasi Oksigen',
                8 => 'Sistolik',
                9 => 'Diastolik',
                _ => '',
              }} : ${value.isEmpty ? na : value} ${switch (key) {
                0 => ' bpm',
                1 => ' hbpm',
                2 => ' cm',
                3 => ' kg',
                4 => ' mg/dL',
                5 => ' °C',
                6 => ' cm',
                7 => ' SpO2',
                8 => ' mmHg',
                9 => ' mmHg',
                _ => '-',
              }}',
            ),
          );

      final formatObjective = mappingObjectives.values.join('\n');

      return AutoSizeText(
        formatObjective,
        style: textTheme.labelMedium,
      );
    }

    return const AutoSizeText('N/A');
  }

  Widget builderResponse({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String descriptionText,
    required Widget action,
  }) {
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
