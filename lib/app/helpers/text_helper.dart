import 'package:flutter/widgets.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class TextHelper {
  static AutoSizeText buildRichText({
    required String text,
    required String highlight,
    required TextStyle highlightStyle,
    TextStyle? defaultStyle,
    TextAlign? textAlign,
  }) {
    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;

    // Iterate over the text to find all occurrences of the highlight text
    while ((indexOfHighlight = text.indexOf(highlight, start)) != -1) {
      // Add text before the highlight text
      if (indexOfHighlight > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, indexOfHighlight),
            style: defaultStyle,
          ),
        );
      }

      // Add the highlight text
      spans.add(
        TextSpan(
          text: highlight,
          style: highlightStyle,
        ),
      );

      // Move the start point
      start = indexOfHighlight + highlight.length;
    }

    // Add the remaining text
    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: defaultStyle,
        ),
      );
    }

    return AutoSizeText.rich(
      TextSpan(
        children: spans,
      ),
      style: defaultStyle,
      textAlign: textAlign,
    );
  }

  static String? capitalizeEachWords(String? text) {
    if (text == null) return text;
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => word.capitalize).join(' ');
  }

  // format int to rupiah
  static String? formatRupiah({
    required num? amount,
    bool isCompact = true,
  }) {
    var formattedAmount = 'Rp, -';

    if (amount != null) {
      if (isCompact) {
        formattedAmount = NumberFormat.compactCurrency(
          locale: 'id',
          symbol: 'Rp. ',
          decimalDigits: 0,
        ).format(amount);
      } else {
        formattedAmount = NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp. ',
          decimalDigits: 0,
        ).format(amount);
      }
    }

    return formattedAmount;
  }

  static String formatNumberPhone(String phoneNumber) {
    if (phoneNumber.startsWith('08')) {
      return '+62${phoneNumber.substring(1)}';
    } else {
      return phoneNumber;
    }
  }

  static String formatNumber(num? number) {
    if (number == null) return '-';

    return NumberFormat.compact(locale: 'id').format(number);
  }
}
