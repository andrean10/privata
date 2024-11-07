import 'package:freezed_annotation/freezed_annotation.dart';

import '../../price_list/selling_price/selling_price_model.dart';

part 'cashier_item_model.freezed.dart';
part 'cashier_item_model.g.dart';

@freezed
class CashierItemModel with _$CashierItemModel {
  const factory CashierItemModel({
    @JsonKey(
      name: '_id',
      includeToJson: false,
    )
    String? id,
    @JsonKey(name: 'id') String? idToJson,
    String? name,
    String? type,
    String? procedureId,
    String? hospitalId,
    @JsonKey(includeIfNull: false) String? kmrProcedureId,
    @JsonKey(includeIfNull: false) String? transactionId,
    int? quantity,
    int? baseFee,
    int? discount,
    int? totalFee,
    bool? isPriceLock,
    String? transactionType,
    String? createdAt,
    String? updatedAt,
    String? createdId,
    List<dynamic>? medicalHelperIds,
    @JsonKey(includeIfNull: false) String? discountType,
    String? createdName,
    @JsonKey(includeIfNull: false) bool? isAdminFee,
    List<dynamic>? itemsUsed,
    int? tuslahFee,
    int? embalaseFee,
    List<SellingPriceModel>? sellingPrice,
    @JsonKey(defaultValue: '1', includeFromJson: false) String? paymentMethodId,
    @JsonKey(defaultValue: 'Normal', includeFromJson: false)
    String? paymentMethodTipe,
    @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
    String? paymentMethodSubTipe,
    @JsonKey(defaultValue: 0, includeFromJson: false) int? paymentMethod,
    // String? unit,
    // String? dosage,
    // bool? isEditFromCashier,
  }) = _CashierItemModel;

  factory CashierItemModel.fromJson(Map<String, Object?> json) =>
      _$CashierItemModelFromJson(json);
}
