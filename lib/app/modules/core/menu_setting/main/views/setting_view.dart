import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/card/cards.dart';
import '../controllers/setting_controller.dart';

class ProfileView extends GetView<SettingController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // builderHeader(context),
            // const SizedBox(height: 24),
            Cards.filled(
              context: context,
              inPadding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final theme = context.theme;
                  final item = controller.menuProfile[index];

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 14,
                      backgroundColor: theme.colorScheme.surface,
                      child: Icon(
                        item.iconData,
                        size: 14,
                      ),
                    ),
                    title: Text(item.label),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () => controller.onTap(
                      context: context,
                      index: index,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.menuProfile.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget builderHeader(BuildContext context) {
  //   final theme = context.theme;
  //   final textTheme = theme.textTheme;

  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       // builderPicture(context),
  //       // const SizedBox(height: 16),
  //       AutoSizeText(
  //         controller.name ?? '-',
  //         style: textTheme.titleLarge,
  //         textAlign: TextAlign.center,
  //       ),
  //       const SizedBox(height: 4),
  //       AutoSizeText(
  //         controller.email ?? '-',
  //         style: textTheme.bodyLarge,
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }

  // Widget builderPicture(BuildContext context) {
  //   final theme = context.theme;
  //   final textTheme = theme.textTheme;

  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Align(
  //         alignment: Alignment.center,
  //         child: Stack(
  //           children: [
  //             const CircleAvatar(
  //               foregroundImage: AssetImage(ConstantsAssets.imgNoPhoto),
  //               minRadius: 40,
  //               maxRadius: 54,
  //             ),
  //             Positioned(
  //               right: 0,
  //               bottom: -4,
  //               child: IconButton.filled(
  //                 iconSize: 14,
  //                 visualDensity: VisualDensity.comfortable,
  //                 style: ButtonStyle(
  //                   side: WidgetStatePropertyAll(
  //                     BorderSide(
  //                       color: theme.colorScheme.surface,
  //                       width: 3,
  //                     ),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     showDragHandle: true,
  //                     builder: (context) {
  //                       return LayoutBuilder(builder: (context, constraints) {
  //                         final maxWidth = constraints.maxWidth;

  //                         return Padding(
  //                           padding: const EdgeInsets.only(
  //                             left: 16,
  //                             right: 16,
  //                             bottom: 16,
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisSize: MainAxisSize.min,
  //                             children: [
  //                               AutoSizeText(
  //                                 'Pilih Opsi',
  //                                 style: textTheme.titleLarge?.copyWith(
  //                                   fontWeight: SharedTheme.bold,
  //                                 ),
  //                               ),
  //                               const SizedBox(height: 21),
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceAround,
  //                                 children: [
  //                                   builderItemSource(
  //                                     width: maxWidth / 7,
  //                                     asset: ConstantsAssets.icGallery,
  //                                     title: 'Galeri',
  //                                     textTheme: textTheme,
  //                                     onPressed: () async {
  //                                       final data = await controller
  //                                           .pickFile(ImageSource.gallery);
  //                                       if (data != null) {
  //                                         final path = data.path;
  //                                       }
  //                                     },
  //                                   ),
  //                                   builderItemSource(
  //                                     width: maxWidth / 7,
  //                                     asset: ConstantsAssets.icCamera,
  //                                     title: 'Kamera',
  //                                     textTheme: textTheme,
  //                                     onPressed: () async {
  //                                       final data = await controller
  //                                           .pickFile(ImageSource.camera);
  //                                       if (data != null) {
  //                                         final path = data.path;
  //                                       }
  //                                     },
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         );
  //                       });
  //                     },
  //                   );
  //                 },
  //                 icon: Icon(
  //                   Icons.edit_rounded,
  //                   color: theme.colorScheme.surface,
  //                 ),
  //                 tooltip: 'Ubah Foto',
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget builderItemSource({
  //   required double width,
  //   required String asset,
  //   required String title,
  //   required TextTheme textTheme,
  //   required Function() onPressed,
  // }) {
  //   return GestureDetector(
  //     onTap: onPressed,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Image.asset(
  //           asset,
  //           width: width,
  //         ),
  //         const SizedBox(height: 12),
  //         AutoSizeText(
  //           title,
  //           style: textTheme.labelLarge,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
