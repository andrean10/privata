// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_rj_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailRJModel _$DetailRJModelFromJson(Map<String, dynamic> json) {
  return _DetailRJModel.fromJson(json);
}

/// @nodoc
mixin _$DetailRJModel {
  String? get milis => throw _privateConstructorUsedError;
  bool? get isBpjs => throw _privateConstructorUsedError;
  String? get mrNo => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get practiceId => throw _privateConstructorUsedError;
  String? get appointId => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get createdName => throw _privateConstructorUsedError;
  String? get createdId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get isShareRMToc => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'VitalSigns')
  List<VitalSignsModel>? get vitalSigns => throw _privateConstructorUsedError;
  @JsonKey(name: 'Patients')
  RJPatientModel? get patients => throw _privateConstructorUsedError;
  @JsonKey(name: 'DoctorNotes')
  List<DoctorNotesModel>? get doctorNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'NurseNotes')
  List<NurseNotesModel>? get nurseNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'Prescriptions')
  List<PrescriptionsModel>? get prescriptions =>
      throw _privateConstructorUsedError; // List<Null>? scourPrescriptions,
  @JsonKey(name: 'Procedures')
  List<ProcedureModel>? get procedures => throw _privateConstructorUsedError;
  @JsonKey(name: 'Appointments')
  AppointmentModel? get appointments => throw _privateConstructorUsedError;
  @JsonKey(name: 'Practices')
  PracticeModel? get practices => throw _privateConstructorUsedError;
  @JsonKey(name: 'Diagnoses')
  List<DiagnosesModel>? get diagnoses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailRJModelCopyWith<DetailRJModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailRJModelCopyWith<$Res> {
  factory $DetailRJModelCopyWith(
          DetailRJModel value, $Res Function(DetailRJModel) then) =
      _$DetailRJModelCopyWithImpl<$Res, DetailRJModel>;
  @useResult
  $Res call(
      {String? milis,
      bool? isBpjs,
      String? mrNo,
      String? status,
      String? practiceId,
      String? appointId,
      String? patientId,
      String? hospitalId,
      String? createdName,
      String? createdId,
      String? createdAt,
      bool? isShareRMToc,
      String? id,
      @JsonKey(name: 'VitalSigns') List<VitalSignsModel>? vitalSigns,
      @JsonKey(name: 'Patients') RJPatientModel? patients,
      @JsonKey(name: 'DoctorNotes') List<DoctorNotesModel>? doctorNotes,
      @JsonKey(name: 'NurseNotes') List<NurseNotesModel>? nurseNotes,
      @JsonKey(name: 'Prescriptions') List<PrescriptionsModel>? prescriptions,
      @JsonKey(name: 'Procedures') List<ProcedureModel>? procedures,
      @JsonKey(name: 'Appointments') AppointmentModel? appointments,
      @JsonKey(name: 'Practices') PracticeModel? practices,
      @JsonKey(name: 'Diagnoses') List<DiagnosesModel>? diagnoses});

  $RJPatientModelCopyWith<$Res>? get patients;
  $AppointmentModelCopyWith<$Res>? get appointments;
  $PracticeModelCopyWith<$Res>? get practices;
}

/// @nodoc
class _$DetailRJModelCopyWithImpl<$Res, $Val extends DetailRJModel>
    implements $DetailRJModelCopyWith<$Res> {
  _$DetailRJModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? milis = freezed,
    Object? isBpjs = freezed,
    Object? mrNo = freezed,
    Object? status = freezed,
    Object? practiceId = freezed,
    Object? appointId = freezed,
    Object? patientId = freezed,
    Object? hospitalId = freezed,
    Object? createdName = freezed,
    Object? createdId = freezed,
    Object? createdAt = freezed,
    Object? isShareRMToc = freezed,
    Object? id = freezed,
    Object? vitalSigns = freezed,
    Object? patients = freezed,
    Object? doctorNotes = freezed,
    Object? nurseNotes = freezed,
    Object? prescriptions = freezed,
    Object? procedures = freezed,
    Object? appointments = freezed,
    Object? practices = freezed,
    Object? diagnoses = freezed,
  }) {
    return _then(_value.copyWith(
      milis: freezed == milis
          ? _value.milis
          : milis // ignore: cast_nullable_to_non_nullable
              as String?,
      isBpjs: freezed == isBpjs
          ? _value.isBpjs
          : isBpjs // ignore: cast_nullable_to_non_nullable
              as bool?,
      mrNo: freezed == mrNo
          ? _value.mrNo
          : mrNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceId: freezed == practiceId
          ? _value.practiceId
          : practiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointId: freezed == appointId
          ? _value.appointId
          : appointId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isShareRMToc: freezed == isShareRMToc
          ? _value.isShareRMToc
          : isShareRMToc // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vitalSigns: freezed == vitalSigns
          ? _value.vitalSigns
          : vitalSigns // ignore: cast_nullable_to_non_nullable
              as List<VitalSignsModel>?,
      patients: freezed == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as RJPatientModel?,
      doctorNotes: freezed == doctorNotes
          ? _value.doctorNotes
          : doctorNotes // ignore: cast_nullable_to_non_nullable
              as List<DoctorNotesModel>?,
      nurseNotes: freezed == nurseNotes
          ? _value.nurseNotes
          : nurseNotes // ignore: cast_nullable_to_non_nullable
              as List<NurseNotesModel>?,
      prescriptions: freezed == prescriptions
          ? _value.prescriptions
          : prescriptions // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionsModel>?,
      procedures: freezed == procedures
          ? _value.procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<ProcedureModel>?,
      appointments: freezed == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as AppointmentModel?,
      practices: freezed == practices
          ? _value.practices
          : practices // ignore: cast_nullable_to_non_nullable
              as PracticeModel?,
      diagnoses: freezed == diagnoses
          ? _value.diagnoses
          : diagnoses // ignore: cast_nullable_to_non_nullable
              as List<DiagnosesModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RJPatientModelCopyWith<$Res>? get patients {
    if (_value.patients == null) {
      return null;
    }

    return $RJPatientModelCopyWith<$Res>(_value.patients!, (value) {
      return _then(_value.copyWith(patients: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppointmentModelCopyWith<$Res>? get appointments {
    if (_value.appointments == null) {
      return null;
    }

    return $AppointmentModelCopyWith<$Res>(_value.appointments!, (value) {
      return _then(_value.copyWith(appointments: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PracticeModelCopyWith<$Res>? get practices {
    if (_value.practices == null) {
      return null;
    }

    return $PracticeModelCopyWith<$Res>(_value.practices!, (value) {
      return _then(_value.copyWith(practices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailRJModelImplCopyWith<$Res>
    implements $DetailRJModelCopyWith<$Res> {
  factory _$$DetailRJModelImplCopyWith(
          _$DetailRJModelImpl value, $Res Function(_$DetailRJModelImpl) then) =
      __$$DetailRJModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? milis,
      bool? isBpjs,
      String? mrNo,
      String? status,
      String? practiceId,
      String? appointId,
      String? patientId,
      String? hospitalId,
      String? createdName,
      String? createdId,
      String? createdAt,
      bool? isShareRMToc,
      String? id,
      @JsonKey(name: 'VitalSigns') List<VitalSignsModel>? vitalSigns,
      @JsonKey(name: 'Patients') RJPatientModel? patients,
      @JsonKey(name: 'DoctorNotes') List<DoctorNotesModel>? doctorNotes,
      @JsonKey(name: 'NurseNotes') List<NurseNotesModel>? nurseNotes,
      @JsonKey(name: 'Prescriptions') List<PrescriptionsModel>? prescriptions,
      @JsonKey(name: 'Procedures') List<ProcedureModel>? procedures,
      @JsonKey(name: 'Appointments') AppointmentModel? appointments,
      @JsonKey(name: 'Practices') PracticeModel? practices,
      @JsonKey(name: 'Diagnoses') List<DiagnosesModel>? diagnoses});

  @override
  $RJPatientModelCopyWith<$Res>? get patients;
  @override
  $AppointmentModelCopyWith<$Res>? get appointments;
  @override
  $PracticeModelCopyWith<$Res>? get practices;
}

/// @nodoc
class __$$DetailRJModelImplCopyWithImpl<$Res>
    extends _$DetailRJModelCopyWithImpl<$Res, _$DetailRJModelImpl>
    implements _$$DetailRJModelImplCopyWith<$Res> {
  __$$DetailRJModelImplCopyWithImpl(
      _$DetailRJModelImpl _value, $Res Function(_$DetailRJModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? milis = freezed,
    Object? isBpjs = freezed,
    Object? mrNo = freezed,
    Object? status = freezed,
    Object? practiceId = freezed,
    Object? appointId = freezed,
    Object? patientId = freezed,
    Object? hospitalId = freezed,
    Object? createdName = freezed,
    Object? createdId = freezed,
    Object? createdAt = freezed,
    Object? isShareRMToc = freezed,
    Object? id = freezed,
    Object? vitalSigns = freezed,
    Object? patients = freezed,
    Object? doctorNotes = freezed,
    Object? nurseNotes = freezed,
    Object? prescriptions = freezed,
    Object? procedures = freezed,
    Object? appointments = freezed,
    Object? practices = freezed,
    Object? diagnoses = freezed,
  }) {
    return _then(_$DetailRJModelImpl(
      milis: freezed == milis
          ? _value.milis
          : milis // ignore: cast_nullable_to_non_nullable
              as String?,
      isBpjs: freezed == isBpjs
          ? _value.isBpjs
          : isBpjs // ignore: cast_nullable_to_non_nullable
              as bool?,
      mrNo: freezed == mrNo
          ? _value.mrNo
          : mrNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceId: freezed == practiceId
          ? _value.practiceId
          : practiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointId: freezed == appointId
          ? _value.appointId
          : appointId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isShareRMToc: freezed == isShareRMToc
          ? _value.isShareRMToc
          : isShareRMToc // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vitalSigns: freezed == vitalSigns
          ? _value._vitalSigns
          : vitalSigns // ignore: cast_nullable_to_non_nullable
              as List<VitalSignsModel>?,
      patients: freezed == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as RJPatientModel?,
      doctorNotes: freezed == doctorNotes
          ? _value._doctorNotes
          : doctorNotes // ignore: cast_nullable_to_non_nullable
              as List<DoctorNotesModel>?,
      nurseNotes: freezed == nurseNotes
          ? _value._nurseNotes
          : nurseNotes // ignore: cast_nullable_to_non_nullable
              as List<NurseNotesModel>?,
      prescriptions: freezed == prescriptions
          ? _value._prescriptions
          : prescriptions // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionsModel>?,
      procedures: freezed == procedures
          ? _value._procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<ProcedureModel>?,
      appointments: freezed == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as AppointmentModel?,
      practices: freezed == practices
          ? _value.practices
          : practices // ignore: cast_nullable_to_non_nullable
              as PracticeModel?,
      diagnoses: freezed == diagnoses
          ? _value._diagnoses
          : diagnoses // ignore: cast_nullable_to_non_nullable
              as List<DiagnosesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailRJModelImpl implements _DetailRJModel {
  const _$DetailRJModelImpl(
      {this.milis,
      this.isBpjs,
      this.mrNo,
      this.status,
      this.practiceId,
      this.appointId,
      this.patientId,
      this.hospitalId,
      this.createdName,
      this.createdId,
      this.createdAt,
      this.isShareRMToc,
      this.id,
      @JsonKey(name: 'VitalSigns') final List<VitalSignsModel>? vitalSigns,
      @JsonKey(name: 'Patients') this.patients,
      @JsonKey(name: 'DoctorNotes') final List<DoctorNotesModel>? doctorNotes,
      @JsonKey(name: 'NurseNotes') final List<NurseNotesModel>? nurseNotes,
      @JsonKey(name: 'Prescriptions')
      final List<PrescriptionsModel>? prescriptions,
      @JsonKey(name: 'Procedures') final List<ProcedureModel>? procedures,
      @JsonKey(name: 'Appointments') this.appointments,
      @JsonKey(name: 'Practices') this.practices,
      @JsonKey(name: 'Diagnoses') final List<DiagnosesModel>? diagnoses})
      : _vitalSigns = vitalSigns,
        _doctorNotes = doctorNotes,
        _nurseNotes = nurseNotes,
        _prescriptions = prescriptions,
        _procedures = procedures,
        _diagnoses = diagnoses;

  factory _$DetailRJModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailRJModelImplFromJson(json);

  @override
  final String? milis;
  @override
  final bool? isBpjs;
  @override
  final String? mrNo;
  @override
  final String? status;
  @override
  final String? practiceId;
  @override
  final String? appointId;
  @override
  final String? patientId;
  @override
  final String? hospitalId;
  @override
  final String? createdName;
  @override
  final String? createdId;
  @override
  final String? createdAt;
  @override
  final bool? isShareRMToc;
  @override
  final String? id;
  final List<VitalSignsModel>? _vitalSigns;
  @override
  @JsonKey(name: 'VitalSigns')
  List<VitalSignsModel>? get vitalSigns {
    final value = _vitalSigns;
    if (value == null) return null;
    if (_vitalSigns is EqualUnmodifiableListView) return _vitalSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Patients')
  final RJPatientModel? patients;
  final List<DoctorNotesModel>? _doctorNotes;
  @override
  @JsonKey(name: 'DoctorNotes')
  List<DoctorNotesModel>? get doctorNotes {
    final value = _doctorNotes;
    if (value == null) return null;
    if (_doctorNotes is EqualUnmodifiableListView) return _doctorNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NurseNotesModel>? _nurseNotes;
  @override
  @JsonKey(name: 'NurseNotes')
  List<NurseNotesModel>? get nurseNotes {
    final value = _nurseNotes;
    if (value == null) return null;
    if (_nurseNotes is EqualUnmodifiableListView) return _nurseNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PrescriptionsModel>? _prescriptions;
  @override
  @JsonKey(name: 'Prescriptions')
  List<PrescriptionsModel>? get prescriptions {
    final value = _prescriptions;
    if (value == null) return null;
    if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// List<Null>? scourPrescriptions,
  final List<ProcedureModel>? _procedures;
// List<Null>? scourPrescriptions,
  @override
  @JsonKey(name: 'Procedures')
  List<ProcedureModel>? get procedures {
    final value = _procedures;
    if (value == null) return null;
    if (_procedures is EqualUnmodifiableListView) return _procedures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Appointments')
  final AppointmentModel? appointments;
  @override
  @JsonKey(name: 'Practices')
  final PracticeModel? practices;
  final List<DiagnosesModel>? _diagnoses;
  @override
  @JsonKey(name: 'Diagnoses')
  List<DiagnosesModel>? get diagnoses {
    final value = _diagnoses;
    if (value == null) return null;
    if (_diagnoses is EqualUnmodifiableListView) return _diagnoses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetailRJModel(milis: $milis, isBpjs: $isBpjs, mrNo: $mrNo, status: $status, practiceId: $practiceId, appointId: $appointId, patientId: $patientId, hospitalId: $hospitalId, createdName: $createdName, createdId: $createdId, createdAt: $createdAt, isShareRMToc: $isShareRMToc, id: $id, vitalSigns: $vitalSigns, patients: $patients, doctorNotes: $doctorNotes, nurseNotes: $nurseNotes, prescriptions: $prescriptions, procedures: $procedures, appointments: $appointments, practices: $practices, diagnoses: $diagnoses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailRJModelImpl &&
            (identical(other.milis, milis) || other.milis == milis) &&
            (identical(other.isBpjs, isBpjs) || other.isBpjs == isBpjs) &&
            (identical(other.mrNo, mrNo) || other.mrNo == mrNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.practiceId, practiceId) ||
                other.practiceId == practiceId) &&
            (identical(other.appointId, appointId) ||
                other.appointId == appointId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.createdName, createdName) ||
                other.createdName == createdName) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isShareRMToc, isShareRMToc) ||
                other.isShareRMToc == isShareRMToc) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._vitalSigns, _vitalSigns) &&
            (identical(other.patients, patients) ||
                other.patients == patients) &&
            const DeepCollectionEquality()
                .equals(other._doctorNotes, _doctorNotes) &&
            const DeepCollectionEquality()
                .equals(other._nurseNotes, _nurseNotes) &&
            const DeepCollectionEquality()
                .equals(other._prescriptions, _prescriptions) &&
            const DeepCollectionEquality()
                .equals(other._procedures, _procedures) &&
            (identical(other.appointments, appointments) ||
                other.appointments == appointments) &&
            (identical(other.practices, practices) ||
                other.practices == practices) &&
            const DeepCollectionEquality()
                .equals(other._diagnoses, _diagnoses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        milis,
        isBpjs,
        mrNo,
        status,
        practiceId,
        appointId,
        patientId,
        hospitalId,
        createdName,
        createdId,
        createdAt,
        isShareRMToc,
        id,
        const DeepCollectionEquality().hash(_vitalSigns),
        patients,
        const DeepCollectionEquality().hash(_doctorNotes),
        const DeepCollectionEquality().hash(_nurseNotes),
        const DeepCollectionEquality().hash(_prescriptions),
        const DeepCollectionEquality().hash(_procedures),
        appointments,
        practices,
        const DeepCollectionEquality().hash(_diagnoses)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailRJModelImplCopyWith<_$DetailRJModelImpl> get copyWith =>
      __$$DetailRJModelImplCopyWithImpl<_$DetailRJModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailRJModelImplToJson(
      this,
    );
  }
}

abstract class _DetailRJModel implements DetailRJModel {
  const factory _DetailRJModel(
      {final String? milis,
      final bool? isBpjs,
      final String? mrNo,
      final String? status,
      final String? practiceId,
      final String? appointId,
      final String? patientId,
      final String? hospitalId,
      final String? createdName,
      final String? createdId,
      final String? createdAt,
      final bool? isShareRMToc,
      final String? id,
      @JsonKey(name: 'VitalSigns') final List<VitalSignsModel>? vitalSigns,
      @JsonKey(name: 'Patients') final RJPatientModel? patients,
      @JsonKey(name: 'DoctorNotes') final List<DoctorNotesModel>? doctorNotes,
      @JsonKey(name: 'NurseNotes') final List<NurseNotesModel>? nurseNotes,
      @JsonKey(name: 'Prescriptions')
      final List<PrescriptionsModel>? prescriptions,
      @JsonKey(name: 'Procedures') final List<ProcedureModel>? procedures,
      @JsonKey(name: 'Appointments') final AppointmentModel? appointments,
      @JsonKey(name: 'Practices') final PracticeModel? practices,
      @JsonKey(name: 'Diagnoses')
      final List<DiagnosesModel>? diagnoses}) = _$DetailRJModelImpl;

  factory _DetailRJModel.fromJson(Map<String, dynamic> json) =
      _$DetailRJModelImpl.fromJson;

  @override
  String? get milis;
  @override
  bool? get isBpjs;
  @override
  String? get mrNo;
  @override
  String? get status;
  @override
  String? get practiceId;
  @override
  String? get appointId;
  @override
  String? get patientId;
  @override
  String? get hospitalId;
  @override
  String? get createdName;
  @override
  String? get createdId;
  @override
  String? get createdAt;
  @override
  bool? get isShareRMToc;
  @override
  String? get id;
  @override
  @JsonKey(name: 'VitalSigns')
  List<VitalSignsModel>? get vitalSigns;
  @override
  @JsonKey(name: 'Patients')
  RJPatientModel? get patients;
  @override
  @JsonKey(name: 'DoctorNotes')
  List<DoctorNotesModel>? get doctorNotes;
  @override
  @JsonKey(name: 'NurseNotes')
  List<NurseNotesModel>? get nurseNotes;
  @override
  @JsonKey(name: 'Prescriptions')
  List<PrescriptionsModel>? get prescriptions;
  @override // List<Null>? scourPrescriptions,
  @JsonKey(name: 'Procedures')
  List<ProcedureModel>? get procedures;
  @override
  @JsonKey(name: 'Appointments')
  AppointmentModel? get appointments;
  @override
  @JsonKey(name: 'Practices')
  PracticeModel? get practices;
  @override
  @JsonKey(name: 'Diagnoses')
  List<DiagnosesModel>? get diagnoses;
  @override
  @JsonKey(ignore: true)
  _$$DetailRJModelImplCopyWith<_$DetailRJModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
