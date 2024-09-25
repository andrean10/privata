import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
class HospitalModel with _$HospitalModel {
  const factory HospitalModel({
    String? nama,
    String? id,
    String? uniqueCode,
  }) = _HospitalModel;

  factory HospitalModel.fromJson(Map<String, Object?> json) =>
      _$HospitalModelFromJson(json);
}
