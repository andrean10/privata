import 'package:freezed_annotation/freezed_annotation.dart';

import 'format_header_payment_receipt_model/format_header_payment_receipt_model.dart';

part 'kconfigs_model.freezed.dart';
part 'kconfigs_model.g.dart';

@freezed
class KConfigsModel with _$KConfigsModel {
  const factory KConfigsModel({
    String? pharmacyAccount,
    FormatHeaderPaymentReceiptModel? formatHeaderPaymentReceipt,
  }) = _KConfigsModel;

  factory KConfigsModel.fromJson(Map<String, Object?> json) =>
      _$KConfigsModelFromJson(json);
}
