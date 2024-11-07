import 'package:freezed_annotation/freezed_annotation.dart';

part 'format_header_payment_receipt_model.freezed.dart';
part 'format_header_payment_receipt_model.g.dart';

@freezed
class FormatHeaderPaymentReceiptModel with _$FormatHeaderPaymentReceiptModel {
  const factory FormatHeaderPaymentReceiptModel({
    String? clinicName,
    String? address,
    String? phone,
    String? npwp,
  }) = _FormatHeaderPaymentReceiptModel;

  factory FormatHeaderPaymentReceiptModel.fromJson(Map<String, Object?> json) =>
      _$FormatHeaderPaymentReceiptModelFromJson(json);
}
