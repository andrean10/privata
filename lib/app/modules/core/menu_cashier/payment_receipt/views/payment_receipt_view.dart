import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/utils/constants_assets.dart';

import '../../../../../../shared/shared_theme.dart';
import '../../../../../../utils/constants_connect.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../controllers/payment_receipt_controller.dart';

class PaymentReceiptView extends GetView<PaymentReceiptController> {
  const PaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builderAppBar(),
      body: _builderBody(context),
      bottomSheet: _builderBottomSheet(context),
      resizeToAvoidBottomInset: true,
    );
  }

  AppBar _builderAppBar() {
    return AppBar(
      title: const Text('Struk Pembayaran'),
      centerTitle: true,
    );
  }

  Widget _builderBody(BuildContext context) {
    final size = context.mediaQuerySize;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 8, 16, size.height * 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builderHeader(context),
          const SizedBox(height: 21),
          _builderInfoHeader(),
          const SizedBox(height: 8),
          _builderSubInfoHeader(),
          const SizedBox(height: 12),
          _builderHeaderItems(),
          const SizedBox(height: 8),
          _builderItems(),
          const SizedBox(height: 21),
          _builderFooter(),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text('Harga : ${TextHelper.formatRupiah(
          //         amount: controller.data?.baseFee,
          //         isCompact: false,
          //       )}'),
          //       Text('Diskon : ${TextHelper.formatRupiah(
          //         amount: controller.data?.discount,
          //         isCompact: false,
          //       )}'),
          //       Text('Total : ${TextHelper.formatRupiah(
          //         amount: controller.data?.totalFee,
          //         isCompact: false,
          //       )}'),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _builderHeader(BuildContext context) {
    final size = context.mediaQuerySize;
    final textTheme = context.textTheme;
    final kConfigs = controller.initC.kConfigs;
    final klinik = controller.initC.klinik;

    return Row(
      children: [
        CachedNetworkImage(
          imageUrl:
              '${ConstantsConnect.endPointImage}${ConstantsConnect.hospitalBucket}/${klinik?.logo}',
          imageBuilder: (context, imageProvider) => Image(image: imageProvider),
          width: size.width * 0.18,
          height: 75,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.2),
              child: Column(
                children: [
                  Text(
                    kConfigs?.formatHeaderPaymentReceipt?.clinicName ??
                        'Klinik -',
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    kConfigs?.formatHeaderPaymentReceipt?.address ?? 'Jl. -',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _builderInfoHeader() {
    final data = controller.data;
    final patients = data?.patients;

    return Column(
      children: [
        _builderRowText(
          title: 'Kasir',
          value: data?.createdName,
        ),
        _builderRowText(
          title: 'Pasien',
          value: patients?.nama,
        ),
        _builderRowText(
          title: 'Alamat',
          value: patients?.address?.jalan,
        ),
        _builderRowText(
          title: 'Metode Pembayaran',
          value: data?.payments?.firstOrNull?.name,
        ),
      ],
    );
  }

  Widget _builderSubInfoHeader() {
    final data = controller.data;
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                FormatDateTime.dateToString(
                  newPattern: 'dd MMMM yyyy',
                  value: data?.createdAt,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                data?.mrNo ?? '-',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  Widget _builderHeaderItems() {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Item',
            style: TextStyle(fontWeight: SharedTheme.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Base Fee',
            style: TextStyle(fontWeight: SharedTheme.bold),
          ),
        ),
        Expanded(
          child: Text(
            'Qty',
            style: TextStyle(fontWeight: SharedTheme.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Total',
            style: TextStyle(fontWeight: SharedTheme.bold),
          ),
        ),
      ],
    );
  }

  Widget _builderItems() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final itemData = controller.data?.items![index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text('${itemData?.name}'),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                TextHelper.formatRupiah(
                  amount: itemData?.baseFee,
                  isCompact: false,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${itemData?.quantity ?? 0}',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                TextHelper.formatRupiah(
                  amount: (itemData?.baseFee ?? 0) * (itemData?.quantity ?? 0),
                  isCompact: false,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: controller.data?.items?.length ?? 0,
    );
  }

  Widget _builderFooter() {
    final data = controller.data;

    return Column(
      children: [
        _builderRowFooterText(
          title: 'Harga',
          value: TextHelper.formatRupiah(
            amount: data?.baseFee,
            isCompact: false,
          ),
        ),
        _builderRowFooterText(
          title: 'Diskon',
          value: TextHelper.formatRupiah(
            amount: data?.discount,
            isCompact: false,
          ),
        ),
        _builderRowFooterText(
          title: 'Total',
          value: TextHelper.formatRupiah(
            amount: data?.totalFee,
            isCompact: false,
          ),
        ),
        const SizedBox(height: 42),
        const Text(
          'Terima Kasih\nSemoga Lekas Sembuh',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _builderRowText({
    required String title,
    String? value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        const Text(':    '),
        Expanded(
          flex: 4,
          child: Text(
            value ?? '-',
          ),
        ),
      ],
    );
  }

  Widget _builderRowFooterText({
    required String title,
    String? value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.topRight,
            child: Text('$title   :    '),
          ),
        ),
        // const Text(':    '),
        Expanded(
          child: Text(value ?? '-'),
        ),
      ],
    );
  }

  Widget _builderBottomSheet(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Buttons.filled(
                onPressed: () {},
                child: const Text('Bagikan'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Obx(
                () => Buttons.filled(
                  state: controller.isLoadingPrint.value,
                  onPressed: (controller.selectedPrinter.value != null ||
                          controller.dataPrinter != null)
                      ? () => controller.printer()
                      : null,
                  child: const Text('Print'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
              onPressed: () async {
                controller.startScan();

                Dialogs.fullScreen(
                  context: context,
                  title: 'Mencari Devices',
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Tutup'),
                    )
                  ],
                  content: Obx(
                    () => Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final printer = controller.bleDevices[index];

                          return Obx(
                            () {
                              return ListTile(
                                title: Text('${printer.name}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${printer.address}'),
                                    const SizedBox(height: 4),
                                    Text(
                                      (printer.isConnected ?? false)
                                          ? 'Tersambung'
                                          : 'Tidak Tersambung',
                                    )
                                  ],
                                ),
                                trailing: controller.isLoading.value
                                    ? const SizedBox(
                                        width: 21,
                                        height: 21,
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      )
                                    : null,
                                onTap: () async {
                                  if (printer.isConnected ?? false) {
                                    await controller
                                        .disconnectedPrinter(printer);
                                  } else {
                                    final isConnected = await controller
                                        .connectedPrinter(printer);

                                    if (isConnected) {
                                      controller.stopScan();
                                      Get.back();
                                    }
                                  }
                                },
                              );
                            },
                          );
                        },
                        itemCount: controller.bleDevices.length,
                      ),
                    ),
                  ),
                  // } else {
                  //   return _builderResponse(
                  //     context: context,
                  //     icon: Icons.bluetooth_searching_rounded,
                  //     iconColor: theme.colorScheme.primary,
                  //     descriptionText:
                  //         'Belum ada devices disekitar yang aktif',
                  //     action: Buttons.filled(
                  //       width: width / 2,
                  //       onPressed: controller.startScan,
                  //       child: const Text('Coba Lagi'),
                  //     ),
                  //   );
                  // }
                  // },

                  // content: SizedBox(
                  //   child: LayoutBuilder(builder: (context, constraints) {
                  //     final width = constraints.maxWidth;

                  //     return StreamBuilder(
                  //       stream: controller
                  //           .flutterThermalPrinterPlugin.devicesStream,
                  //       builder: (context, snapshot) {
                  //         if (snapshot.connectionState ==
                  //             ConnectionState.waiting) {
                  //           return const LinearProgressIndicator();
                  //         }

                  //         if (snapshot.hasError && snapshot.error != null) {
                  //           return _builderResponse(
                  //             context: context,
                  //             icon: Icons.error_rounded,
                  //             iconColor: theme.colorScheme.error,
                  //             descriptionText:
                  //                 'Error saat mendeteksi device bluetooth disekitar',
                  //             action: Buttons.filled(
                  //               width: width / 2,
                  //               onPressed: controller.startScan,
                  //               child: const Text('Coba Lagi'),
                  //             ),
                  //           );
                  //         }

                  //         if (snapshot.hasData &&
                  //             snapshot.data != null &&
                  //             snapshot.data!.isNotEmpty) {
                  //           final data = snapshot.data!;

                  //           print('data: $data');

                  //           return Column(
                  //             children: data
                  //                 .map(
                  //                   (printer) => ListTile(
                  //                     title: Text('${printer.name}'),
                  //                     subtitle: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text('${printer.address}'),
                  //                         const SizedBox(height: 4),
                  //                         Text(
                  //                           (printer.isConnected ?? false)
                  //                               ? 'Tersambung'
                  //                               : 'Tidak Tersambung',
                  //                         )
                  //                       ],
                  //                     ),
                  //                     trailing: controller.isLoading.value
                  //                         ? const SizedBox(
                  //                             width: 21,
                  //                             height: 21,
                  //                             child: CircularProgressIndicator
                  //                                 .adaptive(),
                  //                           )
                  //                         : null,
                  //                     onTap: () async {
                  //                       if (printer.isConnected ?? false) {
                  //                         await controller
                  //                             .disconnectedPrinter(printer);
                  //                       } else {
                  //                         final isConnected = await controller
                  //                             .connectedPrinter(printer);

                  //                         if (isConnected) {
                  //                           controller.stopScan();
                  //                           Get.back();
                  //                         }
                  //                       }
                  //                     },
                  //                   ),
                  //                 )
                  //                 .toList(),
                  //           );

                  //           // return Expanded(
                  //           //   child: ListView.builder(
                  //           //     // shrinkWrap: true,
                  //           //     itemBuilder: (context, index) {
                  //           //       final printer = data[index];

                  //           //       return Obx(
                  //           //         () => ListTile(
                  //           //           title: Text('${printer.name}'),
                  //           //           subtitle: Column(
                  //           //             crossAxisAlignment:
                  //           //                 CrossAxisAlignment.start,
                  //           //             children: [
                  //           //               Text('${printer.address}'),
                  //           //               const SizedBox(height: 4),
                  //           //               Text(
                  //           //                 (printer.isConnected ?? false)
                  //           //                     ? 'Tersambung'
                  //           //                     : 'Tidak Tersambung',
                  //           //               )
                  //           //             ],
                  //           //           ),
                  //           //           // trailing: controller.isLoading.value
                  //           //           //     ? const SizedBox(
                  //           //           //         width: 21,
                  //           //           //         height: 21,
                  //           //           //         child: CircularProgressIndicator
                  //           //           //             .adaptive(),
                  //           //           //       )
                  //           //           //     : null,
                  //           //           onTap: () async {
                  //           //             if (printer.isConnected ?? false) {
                  //           //               await controller
                  //           //                   .disconnectedPrinter(printer);
                  //           //             } else {
                  //           //               final isConnected = await controller
                  //           //                   .connectedPrinter(printer);

                  //           //               if (isConnected) {
                  //           //                 controller.stopScan();
                  //           //                 Get.back();
                  //           //               }
                  //           //             }
                  //           //           },
                  //           //         ),
                  //           //       );
                  //           //     },
                  //           //     itemCount: data.length,
                  //           //   ),
                  //           // );
                  //         } else {
                  //           return _builderResponse(
                  //             context: context,
                  //             icon: Icons.bluetooth_searching_rounded,
                  //             iconColor: theme.colorScheme.primary,
                  //             descriptionText:
                  //                 'Belum ada devices disekitar yang aktif',
                  //             action: Buttons.filled(
                  //               width: width / 2,
                  //               onPressed: controller.startScan,
                  //               child: const Text('Coba Lagi'),
                  //             ),
                  //           );
                  //         }
                  //       },
                  // );
                  // }),
                  // ),
                ).whenComplete(controller.stopScan);
              },
              icon: const Icon(Icons.bluetooth_rounded),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builderResponse({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String descriptionText,
    required Widget action,
  }) {
    final textTheme = context.textTheme;
    return Center(
      child: Column(
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
