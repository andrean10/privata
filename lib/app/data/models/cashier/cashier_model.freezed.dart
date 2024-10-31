// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashierModel _$CashierModelFromJson(Map<String, dynamic> json) {
  return _CashierModel.fromJson(json);
}

/// @nodoc
mixin _$CashierModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get totalFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'Patients')
  PatientModel? get patients => throw _privateConstructorUsedError;
  @JsonKey(name: 'Items')
  List<CashierItemModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashierModelCopyWith<CashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashierModelCopyWith<$Res> {
  factory $CashierModelCopyWith(
          CashierModel value, $Res Function(CashierModel) then) =
      _$CashierModelCopyWithImpl<$Res, CashierModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? status,
      int? totalFee,
      @JsonKey(name: 'Patients') PatientModel? patients,
      @JsonKey(name: 'Items') List<CashierItemModel>? items});

  $PatientModelCopyWith<$Res>? get patients;
}

/// @nodoc
class _$CashierModelCopyWithImpl<$Res, $Val extends CashierModel>
    implements $CashierModelCopyWith<$Res> {
  _$CashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? totalFee = freezed,
    Object? patients = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      patients: freezed == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as PatientModel?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CashierItemModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientModelCopyWith<$Res>? get patients {
    if (_value.patients == null) {
      return null;
    }

    return $PatientModelCopyWith<$Res>(_value.patients!, (value) {
      return _then(_value.copyWith(patients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashierModelImplCopyWith<$Res>
    implements $CashierModelCopyWith<$Res> {
  factory _$$CashierModelImplCopyWith(
          _$CashierModelImpl value, $Res Function(_$CashierModelImpl) then) =
      __$$CashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? status,
      int? totalFee,
      @JsonKey(name: 'Patients') PatientModel? patients,
      @JsonKey(name: 'Items') List<CashierItemModel>? items});

  @override
  $PatientModelCopyWith<$Res>? get patients;
}

/// @nodoc
class __$$CashierModelImplCopyWithImpl<$Res>
    extends _$CashierModelCopyWithImpl<$Res, _$CashierModelImpl>
    implements _$$CashierModelImplCopyWith<$Res> {
  __$$CashierModelImplCopyWithImpl(
      _$CashierModelImpl _value, $Res Function(_$CashierModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? totalFee = freezed,
    Object? patients = freezed,
    Object? items = freezed,
  }) {
    return _then(_$CashierModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      patients: freezed == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as PatientModel?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CashierItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashierModelImpl implements _CashierModel {
  const _$CashierModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.status,
      this.totalFee,
      @JsonKey(name: 'Patients') this.patients,
      @JsonKey(name: 'Items') final List<CashierItemModel>? items})
      : _items = items;

  factory _$CashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashierModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? status;
  @override
  final int? totalFee;
  @override
  @JsonKey(name: 'Patients')
  final PatientModel? patients;
  final List<CashierItemModel>? _items;
  @override
  @JsonKey(name: 'Items')
  List<CashierItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CashierModel(id: $id, status: $status, totalFee: $totalFee, patients: $patients, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalFee, totalFee) ||
                other.totalFee == totalFee) &&
            (identical(other.patients, patients) ||
                other.patients == patients) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, totalFee, patients,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      __$$CashierModelImplCopyWithImpl<_$CashierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashierModelImplToJson(
      this,
    );
  }
}

abstract class _CashierModel implements CashierModel {
  const factory _CashierModel(
          {@JsonKey(name: '_id') final String? id,
          final String? status,
          final int? totalFee,
          @JsonKey(name: 'Patients') final PatientModel? patients,
          @JsonKey(name: 'Items') final List<CashierItemModel>? items}) =
      _$CashierModelImpl;

  factory _CashierModel.fromJson(Map<String, dynamic> json) =
      _$CashierModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get status;
  @override
  int? get totalFee;
  @override
  @JsonKey(name: 'Patients')
  PatientModel? get patients;
  @override
  @JsonKey(name: 'Items')
  List<CashierItemModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
