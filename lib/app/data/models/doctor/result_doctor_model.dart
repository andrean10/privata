import 'package:freezed_annotation/freezed_annotation.dart';

import 'doctor_model.dart';

part 'result_doctor_model.freezed.dart';
part 'result_doctor_model.g.dart';

@freezed
class ResultDoctorModel with _$ResultDoctorModel {
  const factory ResultDoctorModel({
    required List<DoctorModel> items,
    @JsonKey(name: 'total_item') required int totalItem,
    @JsonKey(name: 'total_page') required int totalPage,
    @JsonKey(name: 'current_page') required int currentPage,
  }) = _ResultDoctorModel;

  factory ResultDoctorModel.fromJson(Map<String, Object?> json) =>
      _$ResultDoctorModelFromJson(json);
}
