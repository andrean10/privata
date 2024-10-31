import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier_item_model.freezed.dart';
part 'cashier_item_model.g.dart';

@freezed
class CashierItemModel with _$CashierItemModel {
  const factory CashierItemModel({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? type,
    int? quantity,
    String? depotId,
    String? transactionId,
    String? createdAt,
    String? createdId,
    String? createdName,
    String? updatedAt,
    int? baseFee,
    int? discount,
    int? totalFee,
    String? unit,
    String? dosage,
  }) = _CashierItemModel;

  factory CashierItemModel.fromJson(Map<String, Object?> json) =>
      _$CashierItemModelFromJson(json);
}
