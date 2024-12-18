// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) {
  return _DoctorModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorModel {
  String? get nama => throw _privateConstructorUsedError;
  String? get rs => throw _privateConstructorUsedError; // this.alamat,
// this.posisi,
  String? get telepon => throw _privateConstructorUsedError;
  String? get pengenal => throw _privateConstructorUsedError;
  String? get spesialis =>
      throw _privateConstructorUsedError; // this.spesialisEn,
  String? get dokterFkIds => throw _privateConstructorUsedError;
  String? get rumahSakitId => throw _privateConstructorUsedError; // this.senin,
// this.selasa,
// this.rabu,
// this.kamis,
// this.jumat,
// this.sabtu,
// this.minggu,
// this.gender,
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_visible')
  bool? get isVisible =>
      throw _privateConstructorUsedError; // this.rekomendasi,
// @JsonKey(name: 'gambar_latar') String? gambarLatar,
// this.isHideAntreanTV,
// String? kodeDokterBpjs,
// String? prefixAntrean,
  String? get id => throw _privateConstructorUsedError;
  String? get slugRs =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'level_doctor') bool? levelDoctor,
// this.bpjsResponse,
// String? noKTP,
// this.displayQueueName,
// this.updatedAt,
// this.updatedId,
// this.updatedName,
// this.dkonsulDoctorId,
// this.oldpractitionerIhsId,
// this.practitionerIhsId,
// this.createdAt,
  @JsonKey(name: 'Dokters')
  ItemDoctorModel? get dokters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorModelCopyWith<DoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorModelCopyWith<$Res> {
  factory $DoctorModelCopyWith(
          DoctorModel value, $Res Function(DoctorModel) then) =
      _$DoctorModelCopyWithImpl<$Res, DoctorModel>;
  @useResult
  $Res call(
      {String? nama,
      String? rs,
      String? telepon,
      String? pengenal,
      String? spesialis,
      String? dokterFkIds,
      String? rumahSakitId,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'is_visible') bool? isVisible,
      String? id,
      String? slugRs,
      @JsonKey(name: 'Dokters') ItemDoctorModel? dokters});

  $ItemDoctorModelCopyWith<$Res>? get dokters;
}

/// @nodoc
class _$DoctorModelCopyWithImpl<$Res, $Val extends DoctorModel>
    implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? rs = freezed,
    Object? telepon = freezed,
    Object? pengenal = freezed,
    Object? spesialis = freezed,
    Object? dokterFkIds = freezed,
    Object? rumahSakitId = freezed,
    Object? isVerified = freezed,
    Object? isVisible = freezed,
    Object? id = freezed,
    Object? slugRs = freezed,
    Object? dokters = freezed,
  }) {
    return _then(_value.copyWith(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      rs: freezed == rs
          ? _value.rs
          : rs // ignore: cast_nullable_to_non_nullable
              as String?,
      telepon: freezed == telepon
          ? _value.telepon
          : telepon // ignore: cast_nullable_to_non_nullable
              as String?,
      pengenal: freezed == pengenal
          ? _value.pengenal
          : pengenal // ignore: cast_nullable_to_non_nullable
              as String?,
      spesialis: freezed == spesialis
          ? _value.spesialis
          : spesialis // ignore: cast_nullable_to_non_nullable
              as String?,
      dokterFkIds: freezed == dokterFkIds
          ? _value.dokterFkIds
          : dokterFkIds // ignore: cast_nullable_to_non_nullable
              as String?,
      rumahSakitId: freezed == rumahSakitId
          ? _value.rumahSakitId
          : rumahSakitId // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slugRs: freezed == slugRs
          ? _value.slugRs
          : slugRs // ignore: cast_nullable_to_non_nullable
              as String?,
      dokters: freezed == dokters
          ? _value.dokters
          : dokters // ignore: cast_nullable_to_non_nullable
              as ItemDoctorModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemDoctorModelCopyWith<$Res>? get dokters {
    if (_value.dokters == null) {
      return null;
    }

    return $ItemDoctorModelCopyWith<$Res>(_value.dokters!, (value) {
      return _then(_value.copyWith(dokters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorModelImplCopyWith<$Res>
    implements $DoctorModelCopyWith<$Res> {
  factory _$$DoctorModelImplCopyWith(
          _$DoctorModelImpl value, $Res Function(_$DoctorModelImpl) then) =
      __$$DoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nama,
      String? rs,
      String? telepon,
      String? pengenal,
      String? spesialis,
      String? dokterFkIds,
      String? rumahSakitId,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'is_visible') bool? isVisible,
      String? id,
      String? slugRs,
      @JsonKey(name: 'Dokters') ItemDoctorModel? dokters});

  @override
  $ItemDoctorModelCopyWith<$Res>? get dokters;
}

/// @nodoc
class __$$DoctorModelImplCopyWithImpl<$Res>
    extends _$DoctorModelCopyWithImpl<$Res, _$DoctorModelImpl>
    implements _$$DoctorModelImplCopyWith<$Res> {
  __$$DoctorModelImplCopyWithImpl(
      _$DoctorModelImpl _value, $Res Function(_$DoctorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? rs = freezed,
    Object? telepon = freezed,
    Object? pengenal = freezed,
    Object? spesialis = freezed,
    Object? dokterFkIds = freezed,
    Object? rumahSakitId = freezed,
    Object? isVerified = freezed,
    Object? isVisible = freezed,
    Object? id = freezed,
    Object? slugRs = freezed,
    Object? dokters = freezed,
  }) {
    return _then(_$DoctorModelImpl(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      rs: freezed == rs
          ? _value.rs
          : rs // ignore: cast_nullable_to_non_nullable
              as String?,
      telepon: freezed == telepon
          ? _value.telepon
          : telepon // ignore: cast_nullable_to_non_nullable
              as String?,
      pengenal: freezed == pengenal
          ? _value.pengenal
          : pengenal // ignore: cast_nullable_to_non_nullable
              as String?,
      spesialis: freezed == spesialis
          ? _value.spesialis
          : spesialis // ignore: cast_nullable_to_non_nullable
              as String?,
      dokterFkIds: freezed == dokterFkIds
          ? _value.dokterFkIds
          : dokterFkIds // ignore: cast_nullable_to_non_nullable
              as String?,
      rumahSakitId: freezed == rumahSakitId
          ? _value.rumahSakitId
          : rumahSakitId // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slugRs: freezed == slugRs
          ? _value.slugRs
          : slugRs // ignore: cast_nullable_to_non_nullable
              as String?,
      dokters: freezed == dokters
          ? _value.dokters
          : dokters // ignore: cast_nullable_to_non_nullable
              as ItemDoctorModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorModelImpl implements _DoctorModel {
  const _$DoctorModelImpl(
      {this.nama,
      this.rs,
      this.telepon,
      this.pengenal,
      this.spesialis,
      this.dokterFkIds,
      this.rumahSakitId,
      @JsonKey(name: 'is_verified') this.isVerified,
      @JsonKey(name: 'is_visible') this.isVisible,
      this.id,
      this.slugRs,
      @JsonKey(name: 'Dokters') this.dokters});

  factory _$DoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorModelImplFromJson(json);

  @override
  final String? nama;
  @override
  final String? rs;
// this.alamat,
// this.posisi,
  @override
  final String? telepon;
  @override
  final String? pengenal;
  @override
  final String? spesialis;
// this.spesialisEn,
  @override
  final String? dokterFkIds;
  @override
  final String? rumahSakitId;
// this.senin,
// this.selasa,
// this.rabu,
// this.kamis,
// this.jumat,
// this.sabtu,
// this.minggu,
// this.gender,
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @override
  @JsonKey(name: 'is_visible')
  final bool? isVisible;
// this.rekomendasi,
// @JsonKey(name: 'gambar_latar') String? gambarLatar,
// this.isHideAntreanTV,
// String? kodeDokterBpjs,
// String? prefixAntrean,
  @override
  final String? id;
  @override
  final String? slugRs;
// @JsonKey(name: 'level_doctor') bool? levelDoctor,
// this.bpjsResponse,
// String? noKTP,
// this.displayQueueName,
// this.updatedAt,
// this.updatedId,
// this.updatedName,
// this.dkonsulDoctorId,
// this.oldpractitionerIhsId,
// this.practitionerIhsId,
// this.createdAt,
  @override
  @JsonKey(name: 'Dokters')
  final ItemDoctorModel? dokters;

  @override
  String toString() {
    return 'DoctorModel(nama: $nama, rs: $rs, telepon: $telepon, pengenal: $pengenal, spesialis: $spesialis, dokterFkIds: $dokterFkIds, rumahSakitId: $rumahSakitId, isVerified: $isVerified, isVisible: $isVisible, id: $id, slugRs: $slugRs, dokters: $dokters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorModelImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.rs, rs) || other.rs == rs) &&
            (identical(other.telepon, telepon) || other.telepon == telepon) &&
            (identical(other.pengenal, pengenal) ||
                other.pengenal == pengenal) &&
            (identical(other.spesialis, spesialis) ||
                other.spesialis == spesialis) &&
            (identical(other.dokterFkIds, dokterFkIds) ||
                other.dokterFkIds == dokterFkIds) &&
            (identical(other.rumahSakitId, rumahSakitId) ||
                other.rumahSakitId == rumahSakitId) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slugRs, slugRs) || other.slugRs == slugRs) &&
            (identical(other.dokters, dokters) || other.dokters == dokters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nama,
      rs,
      telepon,
      pengenal,
      spesialis,
      dokterFkIds,
      rumahSakitId,
      isVerified,
      isVisible,
      id,
      slugRs,
      dokters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      __$$DoctorModelImplCopyWithImpl<_$DoctorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorModelImplToJson(
      this,
    );
  }
}

abstract class _DoctorModel implements DoctorModel {
  const factory _DoctorModel(
          {final String? nama,
          final String? rs,
          final String? telepon,
          final String? pengenal,
          final String? spesialis,
          final String? dokterFkIds,
          final String? rumahSakitId,
          @JsonKey(name: 'is_verified') final bool? isVerified,
          @JsonKey(name: 'is_visible') final bool? isVisible,
          final String? id,
          final String? slugRs,
          @JsonKey(name: 'Dokters') final ItemDoctorModel? dokters}) =
      _$DoctorModelImpl;

  factory _DoctorModel.fromJson(Map<String, dynamic> json) =
      _$DoctorModelImpl.fromJson;

  @override
  String? get nama;
  @override
  String? get rs;
  @override // this.alamat,
// this.posisi,
  String? get telepon;
  @override
  String? get pengenal;
  @override
  String? get spesialis;
  @override // this.spesialisEn,
  String? get dokterFkIds;
  @override
  String? get rumahSakitId;
  @override // this.senin,
// this.selasa,
// this.rabu,
// this.kamis,
// this.jumat,
// this.sabtu,
// this.minggu,
// this.gender,
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  @JsonKey(name: 'is_visible')
  bool? get isVisible;
  @override // this.rekomendasi,
// @JsonKey(name: 'gambar_latar') String? gambarLatar,
// this.isHideAntreanTV,
// String? kodeDokterBpjs,
// String? prefixAntrean,
  String? get id;
  @override
  String? get slugRs;
  @override // @JsonKey(name: 'level_doctor') bool? levelDoctor,
// this.bpjsResponse,
// String? noKTP,
// this.displayQueueName,
// this.updatedAt,
// this.updatedId,
// this.updatedName,
// this.dkonsulDoctorId,
// this.oldpractitionerIhsId,
// this.practitionerIhsId,
// this.createdAt,
  @JsonKey(name: 'Dokters')
  ItemDoctorModel? get dokters;
  @override
  @JsonKey(ignore: true)
  _$$DoctorModelImplCopyWith<_$DoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
