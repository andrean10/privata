import 'package:freezed_annotation/freezed_annotation.dart';

import '../patient/patient_model.dart';
import '../payment/payment_model.dart';
import 'items/cashier_item_model.dart';

part 'cashier_model.freezed.dart';
part 'cashier_model.g.dart';

@freezed
class CashierModel with _$CashierModel {
  const factory CashierModel({
    @JsonKey(name: '_id') String? id,
    String? status,
    int? totalFee,
    @JsonKey(name: 'Patients') PatientModel? patients,
    @JsonKey(name: 'Items') List<CashierItemModel>? items,
    @JsonKey(name: 'Payments') List<PaymentModel>? payments,
    String? patientName,
    String? patientId,
    String? mrId,
    String? mrNo,
    int? discount,
    int? baseFee,
    int? paidFee,
    int? subTotalFee,
    int? creditFee,
    int? totalTaxFee,
    String? code, // code invoice
    String? createdAt,
    String? createdId,
    String? createdName,
    bool? isBpjs,
    bool? isOutcome,
    bool? isOnlyPOS,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    int? fixTotalFee,
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, Object?> json) =>
      _$CashierModelFromJson(json);
}
