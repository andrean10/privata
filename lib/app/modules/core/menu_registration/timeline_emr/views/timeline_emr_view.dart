import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/card/cards.dart';
import '../controllers/timeline_emr_controller.dart';

class TimelineEmrView extends GetView<TimelineEmrController> {
  const TimelineEmrView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        itemBuilder: (context, index) {
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
                        '19 Juli 2024',
                        style: textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      AutoSizeText(
                        'Konsul dengan Dr. Saipul Jamil',
                        style: textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText('Subjective'),
                      AutoSizeText('-'),
                      SizedBox(height: 8),
                      AutoSizeText('Objective'),
                      AutoSizeText('-'),
                      SizedBox(height: 8),
                      AutoSizeText('Assessment'),
                      AutoSizeText('-'),
                      SizedBox(height: 8),
                      AutoSizeText('Plan'),
                      AutoSizeText('-'),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: 10,
      ),
    );
  }
}
