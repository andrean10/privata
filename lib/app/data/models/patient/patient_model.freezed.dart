// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) {
  return _PatientModel.fromJson(json);
}

/// @nodoc
mixin _$PatientModel {
  String? get nama => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  String? get tanggalLahir => throw _privateConstructorUsedError;
  List<PHModel>? get ph => throw _privateConstructorUsedError;
  @JsonKey(fromJson: addressFromJson)
  AddressModel? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '_id', includeToJson: false)
  String? get id_ => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientModelCopyWith<PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientModelCopyWith<$Res> {
  factory $PatientModelCopyWith(
          PatientModel value, $Res Function(PatientModel) then) =
      _$PatientModelCopyWithImpl<$Res, PatientModel>;
  @useResult
  $Res call(
      {String? nama,
      int? gender,
      String? tanggalLahir,
      List<PHModel>? ph,
      @JsonKey(fromJson: addressFromJson) AddressModel? address,
      String? phone,
      String? id,
      @JsonKey(name: '_id', includeToJson: false) String? id_});

  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$PatientModelCopyWithImpl<$Res, $Val extends PatientModel>
    implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? gender = freezed,
    Object? tanggalLahir = freezed,
    Object? ph = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? id = freezed,
    Object? id_ = freezed,
  }) {
    return _then(_value.copyWith(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggalLahir: freezed == tanggalLahir
          ? _value.tanggalLahir
          : tanggalLahir // ignore: cast_nullable_to_non_nullable
              as String?,
      ph: freezed == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as List<PHModel>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      id_: freezed == id_
          ? _value.id_
          : id_ // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientModelImplCopyWith<$Res>
    implements $PatientModelCopyWith<$Res> {
  factory _$$PatientModelImplCopyWith(
          _$PatientModelImpl value, $Res Function(_$PatientModelImpl) then) =
      __$$PatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nama,
      int? gender,
      String? tanggalLahir,
      List<PHModel>? ph,
      @JsonKey(fromJson: addressFromJson) AddressModel? address,
      String? phone,
      String? id,
      @JsonKey(name: '_id', includeToJson: false) String? id_});

  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$PatientModelImplCopyWithImpl<$Res>
    extends _$PatientModelCopyWithImpl<$Res, _$PatientModelImpl>
    implements _$$PatientModelImplCopyWith<$Res> {
  __$$PatientModelImplCopyWithImpl(
      _$PatientModelImpl _value, $Res Function(_$PatientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? gender = freezed,
    Object? tanggalLahir = freezed,
    Object? ph = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? id = freezed,
    Object? id_ = freezed,
  }) {
    return _then(_$PatientModelImpl(
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      tanggalLahir: freezed == tanggalLahir
          ? _value.tanggalLahir
          : tanggalLahir // ignore: cast_nullable_to_non_nullable
              as String?,
      ph: freezed == ph
          ? _value._ph
          : ph // ignore: cast_nullable_to_non_nullable
              as List<PHModel>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      id_: freezed == id_
          ? _value.id_
          : id_ // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientModelImpl implements _PatientModel {
  const _$PatientModelImpl(
      {this.nama,
      this.gender,
      this.tanggalLahir,
      final List<PHModel>? ph,
      @JsonKey(fromJson: addressFromJson) this.address,
      this.phone,
      this.id,
      @JsonKey(name: '_id', includeToJson: false) this.id_})
      : _ph = ph;

  factory _$PatientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientModelImplFromJson(json);

  @override
  final String? nama;
  @override
  final int? gender;
  @override
  final String? tanggalLahir;
  final List<PHModel>? _ph;
  @override
  List<PHModel>? get ph {
    final value = _ph;
    if (value == null) return null;
    if (_ph is EqualUnmodifiableListView) return _ph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: addressFromJson)
  final AddressModel? address;
  @override
  final String? phone;
  @override
  final String? id;
  @override
  @JsonKey(name: '_id', includeToJson: false)
  final String? id_;

  @override
  String toString() {
    return 'PatientModel(nama: $nama, gender: $gender, tanggalLahir: $tanggalLahir, ph: $ph, address: $address, phone: $phone, id: $id, id_: $id_)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientModelImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.tanggalLahir, tanggalLahir) ||
                other.tanggalLahir == tanggalLahir) &&
            const DeepCollectionEquality().equals(other._ph, _ph) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.id_, id_) || other.id_ == id_));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nama, gender, tanggalLahir,
      const DeepCollectionEquality().hash(_ph), address, phone, id, id_);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      __$$PatientModelImplCopyWithImpl<_$PatientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientModelImplToJson(
      this,
    );
  }
}

abstract class _PatientModel implements PatientModel {
  const factory _PatientModel(
          {final String? nama,
          final int? gender,
          final String? tanggalLahir,
          final List<PHModel>? ph,
          @JsonKey(fromJson: addressFromJson) final AddressModel? address,
          final String? phone,
          final String? id,
          @JsonKey(name: '_id', includeToJson: false) final String? id_}) =
      _$PatientModelImpl;

  factory _PatientModel.fromJson(Map<String, dynamic> json) =
      _$PatientModelImpl.fromJson;

  @override
  String? get nama;
  @override
  int? get gender;
  @override
  String? get tanggalLahir;
  @override
  List<PHModel>? get ph;
  @override
  @JsonKey(fromJson: addressFromJson)
  AddressModel? get address;
  @override
  String? get phone;
  @override
  String? get id;
  @override
  @JsonKey(name: '_id', includeToJson: false)
  String? get id_;
  @override
  @JsonKey(ignore: true)
  _$$PatientModelImplCopyWith<_$PatientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
