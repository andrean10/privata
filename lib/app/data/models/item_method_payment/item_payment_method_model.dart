import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_payment_method_model.freezed.dart';
part 'item_payment_method_model.g.dart';

@freezed
class ItemPaymentMethodModel with _$ItemPaymentMethodModel {
  const factory ItemPaymentMethodModel({
    @JsonKey(fromJson: idFromJson) String? id,
    String? nama,
    String? tipe,
  }) = _ItemPaymentMethodModel;

  factory ItemPaymentMethodModel.fromJson(Map<String, Object?> json) =>
      _$ItemPaymentMethodModelFromJson(json);
}

String? idFromJson(dynamic json) {
  if (json is String) {
    return json;
  } else if (json is int) {
    return json.toString();
  }

  return null;
}
