import 'package:freezed_annotation/freezed_annotation.dart';

import 'selling_price/selling_price_model.dart';

part 'price_list_model.freezed.dart';
part 'price_list_model.g.dart';

@freezed
class PriceListModel with _$PriceListModel {
  const factory PriceListModel({
    @JsonKey(
      name: '_id',
      includeToJson: false,
    )
    String? id_,
    @JsonKey(
      name: 'id',
      includeFromJson: false,
    )
    String? id,
    int? basicFee,
    String? name,
    List<SellingPriceModel>? sellingPrice,
    int? totalFee,
    int? totalTaxFee,
    String? type,
  }) = _PriceListModel;

  factory PriceListModel.fromJson(Map<String, Object?> json) =>
      _$PriceListModelFromJson(json);
}
