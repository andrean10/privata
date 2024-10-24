// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mrs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MrsModel _$MrsModelFromJson(Map<String, dynamic> json) {
  return _MrsModel.fromJson(json);
}

/// @nodoc
mixin _$MrsModel {
  String? get appointId => throw _privateConstructorUsedError;
  String? get id =>
      throw _privateConstructorUsedError; // List<Diagnoses>? diagnoses,
// List<ScourPrescriptions>? scourPrescriptions,
// List<Prescriptions>? prescriptions,
// List<Null>? skrinning,
// List<Null>? surat,
// List<Null>? procedures,
// List<KMCUPlans>? kMCUPlans,
// List<Null>? psychosocialSpirituals,
  List<VitalSignsModel>? get vitalSigns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MrsModelCopyWith<MrsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MrsModelCopyWith<$Res> {
  factory $MrsModelCopyWith(MrsModel value, $Res Function(MrsModel) then) =
      _$MrsModelCopyWithImpl<$Res, MrsModel>;
  @useResult
  $Res call({String? appointId, String? id, List<VitalSignsModel>? vitalSigns});
}

/// @nodoc
class _$MrsModelCopyWithImpl<$Res, $Val extends MrsModel>
    implements $MrsModelCopyWith<$Res> {
  _$MrsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointId = freezed,
    Object? id = freezed,
    Object? vitalSigns = freezed,
  }) {
    return _then(_value.copyWith(
      appointId: freezed == appointId
          ? _value.appointId
          : appointId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vitalSigns: freezed == vitalSigns
          ? _value.vitalSigns
          : vitalSigns // ignore: cast_nullable_to_non_nullable
              as List<VitalSignsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MrsModelImplCopyWith<$Res>
    implements $MrsModelCopyWith<$Res> {
  factory _$$MrsModelImplCopyWith(
          _$MrsModelImpl value, $Res Function(_$MrsModelImpl) then) =
      __$$MrsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? appointId, String? id, List<VitalSignsModel>? vitalSigns});
}

/// @nodoc
class __$$MrsModelImplCopyWithImpl<$Res>
    extends _$MrsModelCopyWithImpl<$Res, _$MrsModelImpl>
    implements _$$MrsModelImplCopyWith<$Res> {
  __$$MrsModelImplCopyWithImpl(
      _$MrsModelImpl _value, $Res Function(_$MrsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointId = freezed,
    Object? id = freezed,
    Object? vitalSigns = freezed,
  }) {
    return _then(_$MrsModelImpl(
      appointId: freezed == appointId
          ? _value.appointId
          : appointId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vitalSigns: freezed == vitalSigns
          ? _value._vitalSigns
          : vitalSigns // ignore: cast_nullable_to_non_nullable
              as List<VitalSignsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MrsModelImpl implements _MrsModel {
  const _$MrsModelImpl(
      {this.appointId, this.id, final List<VitalSignsModel>? vitalSigns})
      : _vitalSigns = vitalSigns;

  factory _$MrsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MrsModelImplFromJson(json);

  @override
  final String? appointId;
  @override
  final String? id;
// List<Diagnoses>? diagnoses,
// List<ScourPrescriptions>? scourPrescriptions,
// List<Prescriptions>? prescriptions,
// List<Null>? skrinning,
// List<Null>? surat,
// List<Null>? procedures,
// List<KMCUPlans>? kMCUPlans,
// List<Null>? psychosocialSpirituals,
  final List<VitalSignsModel>? _vitalSigns;
// List<Diagnoses>? diagnoses,
// List<ScourPrescriptions>? scourPrescriptions,
// List<Prescriptions>? prescriptions,
// List<Null>? skrinning,
// List<Null>? surat,
// List<Null>? procedures,
// List<KMCUPlans>? kMCUPlans,
// List<Null>? psychosocialSpirituals,
  @override
  List<VitalSignsModel>? get vitalSigns {
    final value = _vitalSigns;
    if (value == null) return null;
    if (_vitalSigns is EqualUnmodifiableListView) return _vitalSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MrsModel(appointId: $appointId, id: $id, vitalSigns: $vitalSigns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MrsModelImpl &&
            (identical(other.appointId, appointId) ||
                other.appointId == appointId) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._vitalSigns, _vitalSigns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appointId, id,
      const DeepCollectionEquality().hash(_vitalSigns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MrsModelImplCopyWith<_$MrsModelImpl> get copyWith =>
      __$$MrsModelImplCopyWithImpl<_$MrsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MrsModelImplToJson(
      this,
    );
  }
}

abstract class _MrsModel implements MrsModel {
  const factory _MrsModel(
      {final String? appointId,
      final String? id,
      final List<VitalSignsModel>? vitalSigns}) = _$MrsModelImpl;

  factory _MrsModel.fromJson(Map<String, dynamic> json) =
      _$MrsModelImpl.fromJson;

  @override
  String? get appointId;
  @override
  String? get id;
  @override // List<Diagnoses>? diagnoses,
// List<ScourPrescriptions>? scourPrescriptions,
// List<Prescriptions>? prescriptions,
// List<Null>? skrinning,
// List<Null>? surat,
// List<Null>? procedures,
// List<KMCUPlans>? kMCUPlans,
// List<Null>? psychosocialSpirituals,
  List<VitalSignsModel>? get vitalSigns;
  @override
  @JsonKey(ignore: true)
  _$$MrsModelImplCopyWith<_$MrsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
