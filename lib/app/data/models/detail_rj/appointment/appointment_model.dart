import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    String? appDate,
    String? doctorName,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, Object?> json) =>
      _$AppointmentModelFromJson(json);
}
