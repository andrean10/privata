// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) {
  return _HospitalModel.fromJson(json);
}

/// @nodoc
mixin _$HospitalModel {
  String? get nama => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get uniqueCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HospitalModelCopyWith<HospitalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalModelCopyWith<$Res> {
  factory $HospitalModelCopyWith(
          HospitalModel value, $Res Function(HospitalModel) then) =
      _$HospitalModelCopyWithImpl<$Res, HospitalModel>;
  @useResult
  $Res call({String? nama, String? id, String? uniqueCode});
}

/// @nodoc
class _$HospitalModelCopyWithImpl<$Res, $Val extends HospitalModel>
    implements $HospitalModelCopyWith<$Res> {
  _$HospitalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? id = freezed,
    Object? uniqueCode = freezed,
  }) {
    return _then(_value.copyWith(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HospitalModelImplCopyWith<$Res>
    implements $HospitalModelCopyWith<$Res> {
  factory _$$HospitalModelImplCopyWith(
          _$HospitalModelImpl value, $Res Function(_$HospitalModelImpl) then) =
      __$$HospitalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nama, String? id, String? uniqueCode});
}

/// @nodoc
class __$$HospitalModelImplCopyWithImpl<$Res>
    extends _$HospitalModelCopyWithImpl<$Res, _$HospitalModelImpl>
    implements _$$HospitalModelImplCopyWith<$Res> {
  __$$HospitalModelImplCopyWithImpl(
      _$HospitalModelImpl _value, $Res Function(_$HospitalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? id = freezed,
    Object? uniqueCode = freezed,
  }) {
    return _then(_$HospitalModelImpl(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalModelImpl implements _HospitalModel {
  const _$HospitalModelImpl({this.nama, this.id, this.uniqueCode});

  factory _$HospitalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalModelImplFromJson(json);

  @override
  final String? nama;
  @override
  final String? id;
  @override
  final String? uniqueCode;

  @override
  String toString() {
    return 'HospitalModel(nama: $nama, id: $id, uniqueCode: $uniqueCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalModelImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uniqueCode, uniqueCode) ||
                other.uniqueCode == uniqueCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nama, id, uniqueCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalModelImplCopyWith<_$HospitalModelImpl> get copyWith =>
      __$$HospitalModelImplCopyWithImpl<_$HospitalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalModelImplToJson(
      this,
    );
  }
}

abstract class _HospitalModel implements HospitalModel {
  const factory _HospitalModel(
      {final String? nama,
      final String? id,
      final String? uniqueCode}) = _$HospitalModelImpl;

  factory _HospitalModel.fromJson(Map<String, dynamic> json) =
      _$HospitalModelImpl.fromJson;

  @override
  String? get nama;
  @override
  String? get id;
  @override
  String? get uniqueCode;
  @override
  @JsonKey(ignore: true)
  _$$HospitalModelImplCopyWith<_$HospitalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
