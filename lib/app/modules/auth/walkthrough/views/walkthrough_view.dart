import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import 'package:privata/app/helpers/text_helper.dart';

import 'package:privata/shared/shared_theme.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../widgets/buttons/buttons.dart';
import '../controllers/walkthrough_controller.dart';

class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final orientation = context.orientation;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: builderContent(orientation, textTheme, theme),
              ),
              const SizedBox(height: 21),
              Expanded(
                child: builderFooter(theme),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget builderContent(
    Orientation orientation,
    TextTheme textTheme,
    ThemeData theme,
  ) {
    return PageView.builder(
      controller: controller.pageC,
      itemBuilder: (context, index) {
        final title = ConstantsStrings.walktroughList[index].title;
        final description = ConstantsStrings.walktroughList[index].description;
        final image = ConstantsStrings.walktroughList[index].image;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        image,
                        width: (orientation == Orientation.portrait)
                            ? maxWidth / 2
                            : maxWidth / 6,
                        height: (orientation == Orientation.portrait)
                            ? maxWidth / 2
                            : maxWidth / 8,
                      ),
                      const SizedBox(height: 20),
                      AutoSizeText(
                        title,
                        style: textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: SharedTheme.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              TextHelper.buildRichText(
                text: description,
                highlight: ConstantsStrings.assist,
                highlightStyle: TextStyle(color: theme.colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
      itemCount: ConstantsStrings.walktroughList.length,
    );
  }

  Widget builderDotsIndicator({
    required ThemeData theme,
    required double width,
    required BoxDecoration decoration,
  }) {
    return AnimatedContainer(
      duration: Durations.long1,
      curve: Curves.fastOutSlowIn,
      width: width,
      height: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: decoration,
    );
  }

  Widget builderFooter(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              ConstantsStrings.walktroughList.length,
              (index) {
                double width;
                BoxDecoration decoration;

                if (index == controller.currentPage.value) {
                  width = 30;
                  decoration = BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                  );
                } else {
                  width = 15;
                  decoration = BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  );
                }

                return builderDotsIndicator(
                  theme: theme,
                  width: width,
                  decoration: decoration,
                );
              },
              growable: false,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Buttons.outlined(
          onPressed: controller.moveToLogin,
          child: const Text(ConstantsStrings.walkthroughTo),
        ),
      ],
    );
  }
}
