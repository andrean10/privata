import 'package:freezed_annotation/freezed_annotation.dart';

part 'selling_price_model.freezed.dart';
part 'selling_price_model.g.dart';

@freezed
class SellingPriceModel with _$SellingPriceModel {
  const factory SellingPriceModel({
    String? idMetodeBayar,
    String? nama,
    String? tipe,
    dynamic harga,
  }) = _SellingPriceModel;

  factory SellingPriceModel.fromJson(Map<String, Object?> json) =>
      _$SellingPriceModelFromJson(json);
}
