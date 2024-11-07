import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_rj/item_rj_model.dart';

part 'rj_model.freezed.dart';
part 'rj_model.g.dart';

@freezed
class RJModel with _$RJModel {
  const factory RJModel({
    required List<ItemRJModel> items,
    @JsonKey(name: 'total_item') required int? totalItem,
    @JsonKey(name: 'total_page') required int? totalPage,
    @JsonKey(name: 'current_page') required int? currentPage,
  }) = _RJModel;

  factory RJModel.fromJson(Map<String, Object?> json) =>
      _$RJModelFromJson(json);
}