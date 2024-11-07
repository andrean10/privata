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
  @JsonKey(name: 'Payments')
  List<PaymentModel>? get payments => throw _privateConstructorUsedError;
  String? get patientName => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get mrId => throw _privateConstructorUsedError;
  String? get mrNo => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  int? get baseFee => throw _privateConstructorUsedError;
  int? get paidFee => throw _privateConstructorUsedError;
  int? get subTotalFee => throw _privateConstructorUsedError;
  int? get creditFee => throw _privateConstructorUsedError;
  int? get totalTaxFee => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError; // code invoice
  String? get createdAt => throw _privateConstructorUsedError;
  String? get createdId => throw _privateConstructorUsedError;
  String? get createdName => throw _privateConstructorUsedError;
  bool? get isBpjs => throw _privateConstructorUsedError;
  bool? get isOutcome => throw _privateConstructorUsedError;
  bool? get isOnlyPOS => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get fixTotalFee => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'Items') List<CashierItemModel>? items,
      @JsonKey(name: 'Payments') List<PaymentModel>? payments,
      String? patientName,
      String? patientId,
      String? mrId,
      String? mrNo,
      int? discount,
      int? baseFee,
      int? paidFee,
      int? subTotalFee,
      int? creditFee,
      int? totalTaxFee,
      String? code,
      String? createdAt,
      String? createdId,
      String? createdName,
      bool? isBpjs,
      bool? isOutcome,
      bool? isOnlyPOS,
      @JsonKey(includeFromJson: false, includeToJson: false) int? fixTotalFee});

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
    Object? payments = freezed,
    Object? patientName = freezed,
    Object? patientId = freezed,
    Object? mrId = freezed,
    Object? mrNo = freezed,
    Object? discount = freezed,
    Object? baseFee = freezed,
    Object? paidFee = freezed,
    Object? subTotalFee = freezed,
    Object? creditFee = freezed,
    Object? totalTaxFee = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? createdName = freezed,
    Object? isBpjs = freezed,
    Object? isOutcome = freezed,
    Object? isOnlyPOS = freezed,
    Object? fixTotalFee = freezed,
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
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      mrId: freezed == mrId
          ? _value.mrId
          : mrId // ignore: cast_nullable_to_non_nullable
              as String?,
      mrNo: freezed == mrNo
          ? _value.mrNo
          : mrNo // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFee: freezed == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      paidFee: freezed == paidFee
          ? _value.paidFee
          : paidFee // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotalFee: freezed == subTotalFee
          ? _value.subTotalFee
          : subTotalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      creditFee: freezed == creditFee
          ? _value.creditFee
          : creditFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTaxFee: freezed == totalTaxFee
          ? _value.totalTaxFee
          : totalTaxFee // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      isBpjs: freezed == isBpjs
          ? _value.isBpjs
          : isBpjs // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOutcome: freezed == isOutcome
          ? _value.isOutcome
          : isOutcome // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnlyPOS: freezed == isOnlyPOS
          ? _value.isOnlyPOS
          : isOnlyPOS // ignore: cast_nullable_to_non_nullable
              as bool?,
      fixTotalFee: freezed == fixTotalFee
          ? _value.fixTotalFee
          : fixTotalFee // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'Items') List<CashierItemModel>? items,
      @JsonKey(name: 'Payments') List<PaymentModel>? payments,
      String? patientName,
      String? patientId,
      String? mrId,
      String? mrNo,
      int? discount,
      int? baseFee,
      int? paidFee,
      int? subTotalFee,
      int? creditFee,
      int? totalTaxFee,
      String? code,
      String? createdAt,
      String? createdId,
      String? createdName,
      bool? isBpjs,
      bool? isOutcome,
      bool? isOnlyPOS,
      @JsonKey(includeFromJson: false, includeToJson: false) int? fixTotalFee});

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
    Object? payments = freezed,
    Object? patientName = freezed,
    Object? patientId = freezed,
    Object? mrId = freezed,
    Object? mrNo = freezed,
    Object? discount = freezed,
    Object? baseFee = freezed,
    Object? paidFee = freezed,
    Object? subTotalFee = freezed,
    Object? creditFee = freezed,
    Object? totalTaxFee = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? createdName = freezed,
    Object? isBpjs = freezed,
    Object? isOutcome = freezed,
    Object? isOnlyPOS = freezed,
    Object? fixTotalFee = freezed,
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
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      mrId: freezed == mrId
          ? _value.mrId
          : mrId // ignore: cast_nullable_to_non_nullable
              as String?,
      mrNo: freezed == mrNo
          ? _value.mrNo
          : mrNo // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFee: freezed == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      paidFee: freezed == paidFee
          ? _value.paidFee
          : paidFee // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotalFee: freezed == subTotalFee
          ? _value.subTotalFee
          : subTotalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      creditFee: freezed == creditFee
          ? _value.creditFee
          : creditFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTaxFee: freezed == totalTaxFee
          ? _value.totalTaxFee
          : totalTaxFee // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      isBpjs: freezed == isBpjs
          ? _value.isBpjs
          : isBpjs // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOutcome: freezed == isOutcome
          ? _value.isOutcome
          : isOutcome // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnlyPOS: freezed == isOnlyPOS
          ? _value.isOnlyPOS
          : isOnlyPOS // ignore: cast_nullable_to_non_nullable
              as bool?,
      fixTotalFee: freezed == fixTotalFee
          ? _value.fixTotalFee
          : fixTotalFee // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'Items') final List<CashierItemModel>? items,
      @JsonKey(name: 'Payments') final List<PaymentModel>? payments,
      this.patientName,
      this.patientId,
      this.mrId,
      this.mrNo,
      this.discount,
      this.baseFee,
      this.paidFee,
      this.subTotalFee,
      this.creditFee,
      this.totalTaxFee,
      this.code,
      this.createdAt,
      this.createdId,
      this.createdName,
      this.isBpjs,
      this.isOutcome,
      this.isOnlyPOS,
      @JsonKey(includeFromJson: false, includeToJson: false) this.fixTotalFee})
      : _items = items,
        _payments = payments;

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

  final List<PaymentModel>? _payments;
  @override
  @JsonKey(name: 'Payments')
  List<PaymentModel>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? patientName;
  @override
  final String? patientId;
  @override
  final String? mrId;
  @override
  final String? mrNo;
  @override
  final int? discount;
  @override
  final int? baseFee;
  @override
  final int? paidFee;
  @override
  final int? subTotalFee;
  @override
  final int? creditFee;
  @override
  final int? totalTaxFee;
  @override
  final String? code;
// code invoice
  @override
  final String? createdAt;
  @override
  final String? createdId;
  @override
  final String? createdName;
  @override
  final bool? isBpjs;
  @override
  final bool? isOutcome;
  @override
  final bool? isOnlyPOS;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? fixTotalFee;

  @override
  String toString() {
    return 'CashierModel(id: $id, status: $status, totalFee: $totalFee, patients: $patients, items: $items, payments: $payments, patientName: $patientName, patientId: $patientId, mrId: $mrId, mrNo: $mrNo, discount: $discount, baseFee: $baseFee, paidFee: $paidFee, subTotalFee: $subTotalFee, creditFee: $creditFee, totalTaxFee: $totalTaxFee, code: $code, createdAt: $createdAt, createdId: $createdId, createdName: $createdName, isBpjs: $isBpjs, isOutcome: $isOutcome, isOnlyPOS: $isOnlyPOS, fixTotalFee: $fixTotalFee)';
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
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.mrId, mrId) || other.mrId == mrId) &&
            (identical(other.mrNo, mrNo) || other.mrNo == mrNo) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.baseFee, baseFee) || other.baseFee == baseFee) &&
            (identical(other.paidFee, paidFee) || other.paidFee == paidFee) &&
            (identical(other.subTotalFee, subTotalFee) ||
                other.subTotalFee == subTotalFee) &&
            (identical(other.creditFee, creditFee) ||
                other.creditFee == creditFee) &&
            (identical(other.totalTaxFee, totalTaxFee) ||
                other.totalTaxFee == totalTaxFee) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            (identical(other.createdName, createdName) ||
                other.createdName == createdName) &&
            (identical(other.isBpjs, isBpjs) || other.isBpjs == isBpjs) &&
            (identical(other.isOutcome, isOutcome) ||
                other.isOutcome == isOutcome) &&
            (identical(other.isOnlyPOS, isOnlyPOS) ||
                other.isOnlyPOS == isOnlyPOS) &&
            (identical(other.fixTotalFee, fixTotalFee) ||
                other.fixTotalFee == fixTotalFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        totalFee,
        patients,
        const DeepCollectionEquality().hash(_items),
        const DeepCollectionEquality().hash(_payments),
        patientName,
        patientId,
        mrId,
        mrNo,
        discount,
        baseFee,
        paidFee,
        subTotalFee,
        creditFee,
        totalTaxFee,
        code,
        createdAt,
        createdId,
        createdName,
        isBpjs,
        isOutcome,
        isOnlyPOS,
        fixTotalFee
      ]);

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
      @JsonKey(name: 'Items') final List<CashierItemModel>? items,
      @JsonKey(name: 'Payments') final List<PaymentModel>? payments,
      final String? patientName,
      final String? patientId,
      final String? mrId,
      final String? mrNo,
      final int? discount,
      final int? baseFee,
      final int? paidFee,
      final int? subTotalFee,
      final int? creditFee,
      final int? totalTaxFee,
      final String? code,
      final String? createdAt,
      final String? createdId,
      final String? createdName,
      final bool? isBpjs,
      final bool? isOutcome,
      final bool? isOnlyPOS,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? fixTotalFee}) = _$CashierModelImpl;

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
  @JsonKey(name: 'Payments')
  List<PaymentModel>? get payments;
  @override
  String? get patientName;
  @override
  String? get patientId;
  @override
  String? get mrId;
  @override
  String? get mrNo;
  @override
  int? get discount;
  @override
  int? get baseFee;
  @override
  int? get paidFee;
  @override
  int? get subTotalFee;
  @override
  int? get creditFee;
  @override
  int? get totalTaxFee;
  @override
  String? get code;
  @override // code invoice
  String? get createdAt;
  @override
  String? get createdId;
  @override
  String? get createdName;
  @override
  bool? get isBpjs;
  @override
  bool? get isOutcome;
  @override
  bool? get isOnlyPOS;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get fixTotalFee;
  @override
  @JsonKey(ignore: true)
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
