import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/file_helper.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.type),
        centerTitle: true,
      ),
      body: PdfPreview(
        pdfFileName: FileHelper.generateRandomFileName(
          uniqueNameFile: controller.type.toLowerCase(),
          ext: 'pdf',
        ),
        enableScrollToPage: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bluetooth_rounded),
            tooltip: 'Cari Printer',
          ),
          IconButton(
            onPressed: () => controller.saveFile(controller.pdfPageFormat),
            icon: const Icon(Icons.download_rounded),
            tooltip: 'Download File',
          ),
        ],
        canChangeOrientation: false,
        canDebug: false,
        canChangePageFormat: false,
        loadingWidget: const CircularProgressIndicator.adaptive(),
        build: (format) => controller.generatePdf(format),
        // onPageFormatChanged: controller.setPageFormatChanged,
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Invoice'),
    //     centerTitle: true,
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(32),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         builderLetterHead(textTheme),
    //         const SizedBox(height: 16),
    //         const Divider(),
    //         Text(
    //           'Bukti Pembayaran',
    //           style: textTheme.headlineSmall
    //               ?.copyWith(fontWeight: SharedTheme.bold),
    //         ),
    //         const Divider(),
    //         builderCustomer(context),
    //         const SizedBox(height: 16),
    //         Align(
    //           alignment: Alignment.topRight,
    //           child: Container(
    //             width: 400,
    //             alignment: Alignment.topRight,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Text(
    //                   'Harap bukti pembayaran ini disimpan sebagai tanda bukti pembayaran yang sah',
    //                   style: textTheme.labelLarge?.copyWith(
    //                     fontWeight: SharedTheme.bold,
    //                   ),
    //                 ),
    //                 const SizedBox(height: 24),
    //                 const Text('Salam Hangat,'),
    //                 const SizedBox(height: 24),
    //                 const Text('Assist.id'),
    //                 Text(
    //                   '*Bukti Pembayaran ini dibuat otomatis by system*',
    //                   style: textTheme.labelLarge?.copyWith(
    //                     fontWeight: SharedTheme.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  // Widget builderLetterHead(TextTheme textTheme) {
  //   return Row(
  //     children: [
  //       Image.asset(
  //         ConstantsAssets.icSplash,
  //         width: 250,
  //       ),
  //       const SizedBox(width: 21),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             'Assist.id PT. Teknologi Media Medika',
  //             style: textTheme.labelLarge,
  //           ),
  //           const Text(
  //             'Jalan Pala Raya No. 325, Kec. Marpoyan Damai\nKota Pekanbaru, Riau, Indonesia, Kodepos: 28294\nWhatsaapp 08211-2222-500 | Website https://assist.id',
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget builderCustomer(BuildContext context) {
  //   final theme = context.theme;
  //   final textTheme = context.textTheme;

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Customer',
  //         style: textTheme.titleSmall,
  //       ),
  //       const SizedBox(height: 8),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const Text(
  //             'KLINIK SAPROL 2\nSdfsdf\nKab. Bangka',
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Yth. klinik saprol',
  //                 style: textTheme.labelLarge,
  //               ),
  //               const Text(
  //                 'Owner\nEmail: kliniksaprol@gmail.com\nPhone: 08525252525',
  //               ),
  //             ],
  //           ),
  //           const Text(
  //             'Invoice Number: INV0000001008\nIssue Date: 21/10/2022/nPaid Date: 07/10/2022\nSales Person: system',
  //           ),
  //         ],
  //       ),
  //       // const Divider(),
  //       const SizedBox(height: 24),
  //       Table(
  //         children: [
  //           builderHeadTable(context),
  //           builderBodyTable(
  //             [
  //               'Ekstra 2000 Kunjungan ClinicaPro',
  //               'Rp 9.600.000',
  //               '1',
  //               'Rp 9.600.000',
  //             ],
  //           ),
  //           builderBodyTable(
  //             [
  //               'Tambah Kapasitas Kunjungan',
  //               'Rp 200',
  //               '1000',
  //               'Rp 200.000',
  //             ],
  //           ),
  //           builderFooterTable(
  //             value: [
  //               'Sub Total',
  //               'Rp 9.800.000',
  //             ],
  //             style: textTheme.labelLarge?.copyWith(
  //               fontWeight: SharedTheme.bold,
  //             ),
  //           ),
  //           builderFooterTable(
  //             value: [
  //               'Discount',
  //               'Rp 200.000',
  //             ],
  //           ),
  //           builderFooterTable(
  //             value: [
  //               'Down Payment',
  //               'Rp 9.600.000',
  //             ],
  //           ),
  //           builderFooterTable(
  //             value: [
  //               'Paid Amount',
  //               'Rp 9.600.000',
  //             ],
  //             decoration: BoxDecoration(
  //               border: Border.symmetric(
  //                 horizontal: BorderSide(
  //                   color: theme.dividerColor,
  //                 ),
  //               ),
  //             ),
  //             style: textTheme.labelLarge?.copyWith(
  //               fontWeight: SharedTheme.bold,
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  // }

  // TableRow builderHeadTable(BuildContext context) {
  //   final theme = context.theme;
  //   final textTheme = context.textTheme;

  //   return TableRow(
  //     decoration: BoxDecoration(
  //       border: Border.symmetric(
  //         horizontal: BorderSide(
  //           color: theme.dividerColor,
  //         ),
  //       ),
  //     ),
  //     children: [
  //       builderItemTable(
  //         text: 'Product Name',
  //         style: textTheme.labelLarge?.copyWith(
  //           fontWeight: SharedTheme.bold,
  //         ),
  //       ),
  //       builderItemTable(
  //         text: 'List Price',
  //         style: textTheme.labelLarge?.copyWith(
  //           fontWeight: SharedTheme.bold,
  //         ),
  //       ),
  //       builderItemTable(
  //         text: 'Qty',
  //         style: textTheme.labelLarge?.copyWith(
  //           fontWeight: SharedTheme.bold,
  //         ),
  //       ),
  //       builderItemTable(
  //         text: 'Amount',
  //         style: textTheme.labelLarge?.copyWith(
  //           fontWeight: SharedTheme.bold,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // TableRow builderBodyTable(List<String> value) {
  //   return TableRow(
  //     children: [
  //       builderItemTable(text: value[0]),
  //       builderItemTable(text: value[1]),
  //       builderItemTable(text: value[2]),
  //       builderItemTable(text: value[3]),
  //     ],
  //   );
  // }

  // TableRow builderFooterTable({
  //   required List<String> value,
  //   Decoration? decoration,
  //   TextStyle? style,
  // }) {
  //   return TableRow(
  //     decoration: decoration,
  //     children: [
  //       const SizedBox.shrink(),
  //       const SizedBox.shrink(),
  //       builderItemTable(
  //         text: value[0],
  //         style: style,
  //       ),
  //       builderItemTable(
  //         text: value[1],
  //         style: style,
  //       ),
  //     ],
  //   );
  // }

  // Widget builderItemTable({
  //   required String text,
  //   TextStyle? style,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Text(
  //       text,
  //       style: style,
  //     ),
  //   );
  // }
}
