import 'package:freezed_annotation/freezed_annotation.dart';

import '../patient/patient_model.dart';
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
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, Object?> json) =>
      _$CashierModelFromJson(json);
}
