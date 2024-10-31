import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:privata/app/helpers/text_helper.dart';

import '../../../../../../shared/shared_theme.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;
    final textTheme = context.textTheme;

    double containerHeight;
    if (size.width > 900) {
      // Tablet besar
      containerHeight = 150.0;
    } else if (size.width > 600) {
      // Tablet kecil atau ponsel besar
      containerHeight = size.height * 0.15;
    } else {
      // Ponsel kecil dengan batas maksimal
      containerHeight = size.height * 0.15;
      containerHeight =
          containerHeight.clamp(70.0, 120.0); // Batasan maksimal untuk ponsel
    }

    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          controller.fetchAllData();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildListDelegate.fixed(
                  [
                    ObxValue(
                      (data) => builderItemAmount(
                        context: context,
                        amount: data.value,
                        label: 'Income',
                        color: Colors.green,
                        icon: Icons.trending_up_rounded,
                      ),
                      controller.income,
                    ),
                    ObxValue(
                      (data) => builderItemAmount(
                        context: context,
                        amount: data.value,
                        label: 'Outcome',
                        color: Colors.red,
                        icon: Icons.trending_down_rounded,
                      ),
                      controller.outcome,
                    ),
                  ],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisExtent: containerHeight,
                  // childAspectRatio: 3 / 2,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Appointment',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: SharedTheme.semiBold,
                          ),
                        ),
                        Buttons.text(
                          onPressed: controller.moveToPatientRegistration,
                          child: const Text('Lihat Semua'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SliverGrid(
                delegate: SliverChildListDelegate.fixed(
                  [
                    ObxValue(
                      (data) => builderItem(
                        context: context,
                        textTheme: textTheme,
                        value: data.value,
                        label: 'Total hari ini',
                        color: Colors.deepOrange,
                        icon: Icons.groups_rounded,
                      ),
                      controller.totalAppointment,
                    ),
                    ObxValue(
                      (data) => builderItem(
                        context: context,
                        textTheme: textTheme,
                        value: data.value,
                        label: 'Pending',
                        color: Colors.orange,
                        icon: Icons.pending_rounded,
                      ),
                      controller.waiting,
                    ),
                    ObxValue(
                      (data) => builderItem(
                        context: context,
                        textTheme: textTheme,
                        value: data.value,
                        label: 'Engaged',
                        color: Colors.blue,
                        icon: Icons.schedule_rounded,
                      ),
                      controller.engaged,
                    ),
                  ],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  // childAspectRatio: 2 / 2,
                  mainAxisExtent: containerHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Antrian Kasir',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: SharedTheme.semiBold,
                          ),
                        ),
                        Buttons.text(
                          onPressed: controller.moveToCashier,
                          child: const Text('Lihat Semua'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverGrid(
                delegate: SliverChildListDelegate.fixed(
                  [
                    ObxValue(
                      (data) => builderItem(
                        context: context,
                        textTheme: textTheme,
                        value: data.value,
                        label: 'Total hari ini',
                        color: Colors.deepOrange,
                        icon: Symbols.orders_rounded,
                      ),
                      controller.totalCashierQueue,
                    ),
                    ObxValue(
                      (data) => builderItem(
                        context: context,
                        textTheme: textTheme,
                        value: data.value,
                        label: 'Belum bayar',
                        color: Colors.redAccent,
                        icon: Symbols.inactive_order_rounded,
                      ),
                      controller.notPaid,
                    ),
                  ],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  // childAspectRatio: 3 / 2,
                  mainAxisExtent: containerHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget builderItemAmount({
    required BuildContext context,
    required int? amount,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Cards.filled(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final widget = Container(
                  width: constraints.maxWidth,
                  foregroundDecoration: (amount == null)
                      ? BoxDecoration(
                          color: theme.hintColor,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: FittedBox(
                    alignment: Alignment.topLeft,
                    child: (amount != null)
                        ? Container(
                            margin: const EdgeInsets.only(right: 32),
                            child: AutoSizeText(
                              TextHelper.formatRupiah(amount: amount),
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: SharedTheme.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                );

                return Visibility(
                  visible: amount == null,
                  replacement: widget,
                  child: Shimmer.fromColors(
                    baseColor: theme.colorScheme.onSurface,
                    highlightColor: theme.colorScheme.surface,
                    child: widget,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // flex: 2,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      label,
                      style: textTheme.labelLarge,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final maxWidth = constraints.maxWidth;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: color,
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: maxWidth * 0.2,
                        ),
                      );
                    },
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     padding: const EdgeInsets.all(8),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       color: color,
                //     ),
                //     child: Icon(
                //       icon,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builderItem({
    required BuildContext context,
    required TextTheme textTheme,
    required int? value,
    required String label,
    required Color color,
    required IconData icon,
    Color? iconColor,
  }) {
    final theme = context.theme;

    return Cards.filled(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final widget = Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight / 2,
                        foregroundDecoration: (value == null)
                            ? BoxDecoration(
                                color: theme.hintColor,
                                borderRadius: BorderRadius.circular(12),
                              )
                            : null,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: (value != null)
                              ? AutoSizeText(
                                  TextHelper.formatNumber(value),
                                  style: textTheme.titleSmall?.copyWith(
                                    fontWeight: SharedTheme.bold,
                                  ),
                                )
                              : Container(),
                        ),
                      );

                      return Visibility(
                        visible: value == null,
                        replacement: widget,
                        child: Shimmer.fromColors(
                          baseColor: theme.colorScheme.onSurface,
                          highlightColor: theme.colorScheme.surface,
                          child: widget,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final maxWidth = constraints.maxWidth;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: color,
                        ),
                        child: Icon(
                          icon,
                          color: iconColor ?? Colors.white,
                          size: maxWidth * 0.4,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FittedBox(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.fromLTRB(2, 0, 4, 2),
                child: AutoSizeText(
                  label,
                  style: textTheme.labelLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
