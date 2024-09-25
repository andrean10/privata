import 'package:freezed_annotation/freezed_annotation.dart';

import 'error/error_model.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ResultModel<T> with _$ResultModel<T> {
  const factory ResultModel.successWithData(T data) = SuccessWithData<T>;

  const factory ResultModel.successWithPages({
    required List<T> items,
    @JsonKey(name: 'total_item') required int totalItem,
    @JsonKey(name: 'total_page') required int totalPage,
    @JsonKey(name: 'current_page') required int currentPage,
  }) = SuccessWithPages<T>;

  const factory ResultModel.error(ErrorModel error) = Error;

  factory ResultModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResultModelFromJson(json, fromJsonT);
}
