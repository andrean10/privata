import 'package:flutter/services.dart';
import 'package:privata/app/helpers/text_helper.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue.copyWith(text: 'Rp. ');

    final int selectionIndex = newValue.selection.end;
    final number =
        int.tryParse(newValue.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

    final formatted = TextHelper.formatRupiah(
      amount: number,
      isCompact: false,
    );

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: selectionIndex + formatted.length - newValue.text.length,
      ),
    );
  }
}
