import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as ph;
import 'package:printing/printing.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../shared/shared_method.dart';
import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../helpers/file_helper.dart';

class InvoiceController extends GetxController {
  late final InitController _initC;
  PdfPageFormat? pdfPageFormat;

  final _dir = Directory('/storage/emulated/0/documents');
  var type = '-';

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    type = Get.arguments as String;
  }

  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    pdfPageFormat = format;

    final pdf = pw.Document(
      pageMode: PdfPageMode.fullscreen,
      title: type,
      author: 'Assist.id',
    );

    final imgIcon = await imageFromAssetBundle(ConstantsAssets.icSplash);

    final fontRegular = await PdfGoogleFonts.poppinsRegular();
    final fontSemiBold = await PdfGoogleFonts.poppinsSemiBold();
    final fontBold = await PdfGoogleFonts.poppinsBold();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(32),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              builderLetterHead(
                fontRegular: fontRegular,
                fontSemiBold: fontSemiBold,
                imgIcon: imgIcon,
              ),
              pw.SizedBox(height: 16),
              pw.Divider(),
              pw.Text(
                type,
                style: pw.TextStyle(
                  font: fontSemiBold,
                  fontSize: 18,
                ),
              ),
              pw.Divider(),
              pw.SizedBox(height: 16),
              builderCustomer(
                fontSemiBold: fontSemiBold,
                fontBold: fontBold,
              ),
              pw.SizedBox(height: 16),
              pw.Align(
                alignment: pw.Alignment.topRight,
                child: pw.Container(
                  width: 300,
                  alignment: pw.Alignment.topRight,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text(
                        'Harap bukti pembayaran ini disimpan sebagai tanda bukti pembayaran yang sah',
                        style: pw.TextStyle(
                          font: fontBold,
                          fontSize: 10,
                        ),
                      ),
                      pw.SizedBox(height: 24),
                      pw.Text('Salam Hangat,'),
                      pw.SizedBox(height: 24),
                      pw.Text('Assist.id'),
                      pw.Text(
                        '*Bukti Pembayaran ini dibuat otomatis by system*',
                        style: pw.TextStyle(
                          font: fontBold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget builderLetterHead({
    required pw.ImageProvider imgIcon,
    required pw.Font fontRegular,
    required pw.Font fontSemiBold,
  }) {
    return pw.Row(
      children: [
        pw.Image(
          imgIcon,
          width: 125,
        ),
        pw.SizedBox(width: 21),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisSize: pw.MainAxisSize.min,
          children: [
            pw.Text(
              'Assist.id PT. Teknologi Media Medika',
              style: pw.TextStyle(font: fontSemiBold
                  // fontSize: 14,
                  ),
            ),
            pw.Text(
              'Jalan Pala Raya No. 325, Kec. Marpoyan Damai\nKota Pekanbaru, Riau, Indonesia, Kodepos: 28294\nWhatsaapp 08211-2222-500 | Website https://assist.id',
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget builderCustomer({
    required pw.Font fontSemiBold,
    required pw.Font fontBold,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Customer',
          style: pw.TextStyle(font: fontSemiBold),
        ),
        pw.SizedBox(height: 8),
        pw.Table(
          defaultColumnWidth: const pw.IntrinsicColumnWidth(flex: 2),
          children: [
            builderBodyTable(
              value: [
                """
KLINIK SAPROL 2
Sdfsdf
Kab. Bangka
""",
                """
Yth. klinik saprol
Owner
Email: kliniksaprol@gmail.com
Phone: 08525252525
""",
                """
Invoice Number: INV0000001008
Issue Date: 21/10/2022
Paid Date: 07/10/2022
Sales Person: system
""",
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 24),
        pw.Table(
          defaultColumnWidth: const pw.IntrinsicColumnWidth(flex: 2),
          children: [
            builderHeadTable(fontBold: fontBold),
            builderBodyTable(
              value: [
                'Ekstra 2000 Kunjungan ClinicaPro',
                'Rp 9.600.000',
                '1',
                'Rp 9.600.000',
              ],
            ),
            builderBodyTable(
              value: [
                'Tambah Kapasitas Kunjungan',
                'Rp 200',
                '1000',
                'Rp 200.000',
              ],
            ),
            builderFooterTable(
              value: [
                'Sub Total',
                'Rp 9.800.000',
              ],
              style: pw.TextStyle(font: fontBold),
              isOnlyTopBorder: true,
            ),
            builderFooterTable(
              value: [
                'Discount',
                'Rp 200.000',
              ],
            ),
            builderFooterTable(
              value: [
                'Down Payment',
                'Rp 9.600.000',
              ],
            ),
            builderFooterTable(
              value: [
                'Paid Amount',
                'Rp 9.600.000',
              ],
              isBorder: true,
              style: pw.TextStyle(font: fontBold),
            ),
          ],
        ),
      ],
    );
  }

  pw.TableRow builderHeadTable({required pw.Font fontBold}) {
    final tableTitle = [
      'Product Name',
      'List Price',
      'Qty',
      'Amount',
    ];

    return pw.TableRow(
      decoration: const pw.BoxDecoration(
        border: pw.Border.symmetric(
          horizontal: pw.BorderSide(
            color: PdfColors.grey,
          ),
        ),
      ),
      children: tableTitle
          .map(
            (e) => builderItemTable(
              text: e,
              style: pw.TextStyle(font: fontBold),
              countPadding: 4,
            ),
          )
          .toList(),
    );
  }

  pw.TableRow builderBodyTable({
    required List<String> value,
    bool isBorder = false,
  }) {
    return pw.TableRow(
      children: value
          .map(
            (e) => builderItemTable(
              text: e,
              isBorder: isBorder,
            ),
          )
          .toList(),
    );
  }

  pw.TableRow builderFooterTable({
    required List<String> value,
    pw.TextStyle? style,
    bool isBorder = false,
    bool isOnlyTopBorder = false,
  }) {
    return pw.TableRow(
      decoration: (isOnlyTopBorder)
          ? const pw.BoxDecoration(
              border: pw.Border(
                top: pw.BorderSide(
                  color: PdfColors.grey,
                ),
              ),
            )
          : null,
      children: [
        pw.SizedBox.shrink(),
        pw.SizedBox.shrink(),
        builderItemTable(
          text: value[0],
          style: style,
          countPadding: 4,
          isBorder: isBorder,
        ),
        builderItemTable(
          text: value[1],
          style: style,
          countPadding: 4,
          isBorder: isBorder,
        ),
      ],
    );
  }

  pw.Widget builderItemTable({
    required String text,
    double countPadding = 2,
    pw.TextStyle? style,
    bool isBorder = false,
  }) {
    return pw.Container(
      decoration: (isBorder)
          ? const pw.BoxDecoration(
              border: pw.Border.symmetric(
                horizontal: pw.BorderSide(color: PdfColors.grey),
              ),
            )
          : null,
      padding: pw.EdgeInsets.all(countPadding),
      child: pw.Text(
        text,
        style: style,
      ),
    );
  }

  void saveFile(PdfPageFormat? format) async {
    if (format != null) {
      try {
        showSnackbar(
          context: Get.context!,
          content: 'Sedang Mengunduh...',
          backgroundColor: Get.isDarkMode
              ? SharedTheme.darkInfoColor
              : SharedTheme.lightInfoColor,
        );

        _initC.logger.d('debug: saveFile dijalankan');

        final file = File(
          ph.join(
              '${_dir.path}/${FileHelper.generateRandomFileName(uniqueNameFile: 'invoice', ext: 'pdf')}'),
        )
          ..createSync(recursive: true)
          ..writeAsBytesSync(await generatePdf(format));

        ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
        showSnackbar(
          context: Get.context!,
          content: 'File berhasil diunduh dan tersimpan di ${file.path}',
          // path: file.path,
          backgroundColor: Get.isDarkMode
              ? SharedTheme.darkSuccessColor
              : SharedTheme.lightSuccessColor,
          duration: 5.seconds,
        );
      } catch (e) {
        _initC.logger.e('Error: $e');
        showSnackbar(
          context: Get.context!,
          backgroundColor: Get.theme.colorScheme.error,
          content: 'Tidak dapat menyyimpan file PDF',
          duration: 5.seconds,
        );
      }
    } else {
      showSnackbar(
        context: Get.context!,
        backgroundColor: Get.theme.colorScheme.error,
        content:
            'Tidak dapat menyimpan file PDF, pastikan layout kertas sudah dipilih',
        duration: 5.seconds,
      );
    }
  }
}
