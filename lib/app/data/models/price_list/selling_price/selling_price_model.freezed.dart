// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selling_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SellingPriceModel _$SellingPriceModelFromJson(Map<String, dynamic> json) {
  return _SellingPriceModel.fromJson(json);
}

/// @nodoc
mixin _$SellingPriceModel {
  String? get idMetodeBayar => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get tipe => throw _privateConstructorUsedError;
  dynamic get harga => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellingPriceModelCopyWith<SellingPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellingPriceModelCopyWith<$Res> {
  factory $SellingPriceModelCopyWith(
          SellingPriceModel value, $Res Function(SellingPriceModel) then) =
      _$SellingPriceModelCopyWithImpl<$Res, SellingPriceModel>;
  @useResult
  $Res call({String? idMetodeBayar, String? nama, String? tipe, dynamic harga});
}

/// @nodoc
class _$SellingPriceModelCopyWithImpl<$Res, $Val extends SellingPriceModel>
    implements $SellingPriceModelCopyWith<$Res> {
  _$SellingPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMetodeBayar = freezed,
    Object? nama = freezed,
    Object? tipe = freezed,
    Object? harga = freezed,
  }) {
    return _then(_value.copyWith(
      idMetodeBayar: freezed == idMetodeBayar
          ? _value.idMetodeBayar
          : idMetodeBayar // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      tipe: freezed == tipe
          ? _value.tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellingPriceModelImplCopyWith<$Res>
    implements $SellingPriceModelCopyWith<$Res> {
  factory _$$SellingPriceModelImplCopyWith(_$SellingPriceModelImpl value,
          $Res Function(_$SellingPriceModelImpl) then) =
      __$$SellingPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? idMetodeBayar, String? nama, String? tipe, dynamic harga});
}

/// @nodoc
class __$$SellingPriceModelImplCopyWithImpl<$Res>
    extends _$SellingPriceModelCopyWithImpl<$Res, _$SellingPriceModelImpl>
    implements _$$SellingPriceModelImplCopyWith<$Res> {
  __$$SellingPriceModelImplCopyWithImpl(_$SellingPriceModelImpl _value,
      $Res Function(_$SellingPriceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMetodeBayar = freezed,
    Object? nama = freezed,
    Object? tipe = freezed,
    Object? harga = freezed,
  }) {
    return _then(_$SellingPriceModelImpl(
      idMetodeBayar: freezed == idMetodeBayar
          ? _value.idMetodeBayar
          : idMetodeBayar // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      tipe: freezed == tipe
          ? _value.tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellingPriceModelImpl implements _SellingPriceModel {
  const _$SellingPriceModelImpl(
      {this.idMetodeBayar, this.nama, this.tipe, this.harga});

  factory _$SellingPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellingPriceModelImplFromJson(json);

  @override
  final String? idMetodeBayar;
  @override
  final String? nama;
  @override
  final String? tipe;
  @override
  final dynamic harga;

  @override
  String toString() {
    return 'SellingPriceModel(idMetodeBayar: $idMetodeBayar, nama: $nama, tipe: $tipe, harga: $harga)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellingPriceModelImpl &&
            (identical(other.idMetodeBayar, idMetodeBayar) ||
                other.idMetodeBayar == idMetodeBayar) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.tipe, tipe) || other.tipe == tipe) &&
            const DeepCollectionEquality().equals(other.harga, harga));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idMetodeBayar, nama, tipe,
      const DeepCollectionEquality().hash(harga));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellingPriceModelImplCopyWith<_$SellingPriceModelImpl> get copyWith =>
      __$$SellingPriceModelImplCopyWithImpl<_$SellingPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellingPriceModelImplToJson(
      this,
    );
  }
}

abstract class _SellingPriceModel implements SellingPriceModel {
  const factory _SellingPriceModel(
      {final String? idMetodeBayar,
      final String? nama,
      final String? tipe,
      final dynamic harga}) = _$SellingPriceModelImpl;

  factory _SellingPriceModel.fromJson(Map<String, dynamic> json) =
      _$SellingPriceModelImpl.fromJson;

  @override
  String? get idMetodeBayar;
  @override
  String? get nama;
  @override
  String? get tipe;
  @override
  dynamic get harga;
  @override
  @JsonKey(ignore: true)
  _$$SellingPriceModelImplCopyWith<_$SellingPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
