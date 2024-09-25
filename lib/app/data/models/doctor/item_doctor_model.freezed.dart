// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDoctorModel _$ItemDoctorModelFromJson(Map<String, dynamic> json) {
  return _ItemDoctorModel.fromJson(json);
}

/// @nodoc
mixin _$ItemDoctorModel {
  String? get gelar => throw _privateConstructorUsedError;
  @JsonKey(name: 'gambar_profil')
  String? get gambarProfil => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDoctorModelCopyWith<ItemDoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDoctorModelCopyWith<$Res> {
  factory $ItemDoctorModelCopyWith(
          ItemDoctorModel value, $Res Function(ItemDoctorModel) then) =
      _$ItemDoctorModelCopyWithImpl<$Res, ItemDoctorModel>;
  @useResult
  $Res call(
      {String? gelar,
      @JsonKey(name: 'gambar_profil') String? gambarProfil,
      String? id});
}

/// @nodoc
class _$ItemDoctorModelCopyWithImpl<$Res, $Val extends ItemDoctorModel>
    implements $ItemDoctorModelCopyWith<$Res> {
  _$ItemDoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gelar = freezed,
    Object? gambarProfil = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      gelar: freezed == gelar
          ? _value.gelar
          : gelar // ignore: cast_nullable_to_non_nullable
              as String?,
      gambarProfil: freezed == gambarProfil
          ? _value.gambarProfil
          : gambarProfil // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDoctorModelImplCopyWith<$Res>
    implements $ItemDoctorModelCopyWith<$Res> {
  factory _$$ItemDoctorModelImplCopyWith(_$ItemDoctorModelImpl value,
          $Res Function(_$ItemDoctorModelImpl) then) =
      __$$ItemDoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? gelar,
      @JsonKey(name: 'gambar_profil') String? gambarProfil,
      String? id});
}

/// @nodoc
class __$$ItemDoctorModelImplCopyWithImpl<$Res>
    extends _$ItemDoctorModelCopyWithImpl<$Res, _$ItemDoctorModelImpl>
    implements _$$ItemDoctorModelImplCopyWith<$Res> {
  __$$ItemDoctorModelImplCopyWithImpl(
      _$ItemDoctorModelImpl _value, $Res Function(_$ItemDoctorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gelar = freezed,
    Object? gambarProfil = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ItemDoctorModelImpl(
      gelar: freezed == gelar
          ? _value.gelar
          : gelar // ignore: cast_nullable_to_non_nullable
              as String?,
      gambarProfil: freezed == gambarProfil
          ? _value.gambarProfil
          : gambarProfil // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDoctorModelImpl implements _ItemDoctorModel {
  const _$ItemDoctorModelImpl(
      {this.gelar, @JsonKey(name: 'gambar_profil') this.gambarProfil, this.id});

  factory _$ItemDoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDoctorModelImplFromJson(json);

  @override
  final String? gelar;
  @override
  @JsonKey(name: 'gambar_profil')
  final String? gambarProfil;
  @override
  final String? id;

  @override
  String toString() {
    return 'ItemDoctorModel(gelar: $gelar, gambarProfil: $gambarProfil, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDoctorModelImpl &&
            (identical(other.gelar, gelar) || other.gelar == gelar) &&
            (identical(other.gambarProfil, gambarProfil) ||
                other.gambarProfil == gambarProfil) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gelar, gambarProfil, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDoctorModelImplCopyWith<_$ItemDoctorModelImpl> get copyWith =>
      __$$ItemDoctorModelImplCopyWithImpl<_$ItemDoctorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDoctorModelImplToJson(
      this,
    );
  }
}

abstract class _ItemDoctorModel implements ItemDoctorModel {
  const factory _ItemDoctorModel(
      {final String? gelar,
      @JsonKey(name: 'gambar_profil') final String? gambarProfil,
      final String? id}) = _$ItemDoctorModelImpl;

  factory _ItemDoctorModel.fromJson(Map<String, dynamic> json) =
      _$ItemDoctorModelImpl.fromJson;

  @override
  String? get gelar;
  @override
  @JsonKey(name: 'gambar_profil')
  String? get gambarProfil;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ItemDoctorModelImplCopyWith<_$ItemDoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
