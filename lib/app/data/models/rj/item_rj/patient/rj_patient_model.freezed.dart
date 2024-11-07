// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rj_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RJPatientModel _$RJPatientModelFromJson(Map<String, dynamic> json) {
  return _RJPatientModel.fromJson(json);
}

/// @nodoc
mixin _$RJPatientModel {
  String? get nama => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  String? get tanggalLahir => throw _privateConstructorUsedError;
  List<PHModel>? get ph => throw _privateConstructorUsedError;
  String? get religion => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_place')
  String? get birthPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_domicile')
  String? get addressDomicile => throw _privateConstructorUsedError;
  @JsonKey(fromJson: addressFromJson)
  AddressModel? get address => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_type')
  String? get bloodType => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'id_ext') String? idExt,
  String? get education =>
      throw _privateConstructorUsedError; // bool? isShareMr,
  String? get noKTP => throw _privateConstructorUsedError;
  List<PaymentMethodModel>? get paymentMethod =>
      throw _privateConstructorUsedError;
  List<FamilyModel>? get family =>
      throw _privateConstructorUsedError; // BpjsInfo? bpjsInfo,
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_id')
  String? get createdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError; // bool? isNew,
// bool? isDeleted,
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_users')
  List<String>? get idUsers => throw _privateConstructorUsedError;
  String? get ihsId => throw _privateConstructorUsedError;
  String? get hp =>
      throw _privateConstructorUsedError; // CompanyInfo? companyInfo,
  bool? get isGenerateMrCode => throw _privateConstructorUsedError;
  String? get motherName => throw _privateConstructorUsedError;
  List<String>? get medicalHistory => throw _privateConstructorUsedError;
  List<AllergicHistoryModel>? get allergicHistory =>
      throw _privateConstructorUsedError; // List<MedicalHistoryFamily>? medicalHistoryFamily,
  List<dynamic>? get medicineHistory => throw _privateConstructorUsedError;
  bool? get isTemporary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_medicaboo')
  bool? get isMedicaboo => throw _privateConstructorUsedError; // bool? isOA,
  String? get patientIhsId => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RJPatientModelCopyWith<RJPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RJPatientModelCopyWith<$Res> {
  factory $RJPatientModelCopyWith(
          RJPatientModel value, $Res Function(RJPatientModel) then) =
      _$RJPatientModelCopyWithImpl<$Res, RJPatientModel>;
  @useResult
  $Res call(
      {String? nama,
      int? gender,
      String? tanggalLahir,
      List<PHModel>? ph,
      String? religion,
      @JsonKey(name: 'birth_place') String? birthPlace,
      @JsonKey(name: 'address_domicile') String? addressDomicile,
      @JsonKey(fromJson: addressFromJson) AddressModel? address,
      String? status,
      String? job,
      @JsonKey(name: 'blood_type') String? bloodType,
      String? phone,
      String? email,
      String? education,
      String? noKTP,
      List<PaymentMethodModel>? paymentMethod,
      List<FamilyModel>? family,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'created_id') String? createdId,
      @JsonKey(name: 'updated_at') String? updatedAt,
      String? id,
      @JsonKey(name: 'id_users') List<String>? idUsers,
      String? ihsId,
      String? hp,
      bool? isGenerateMrCode,
      String? motherName,
      List<String>? medicalHistory,
      List<AllergicHistoryModel>? allergicHistory,
      List<dynamic>? medicineHistory,
      bool? isTemporary,
      @JsonKey(name: 'is_medicaboo') bool? isMedicaboo,
      String? patientIhsId,
      String? profilePicture});

  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$RJPatientModelCopyWithImpl<$Res, $Val extends RJPatientModel>
    implements $RJPatientModelCopyWith<$Res> {
  _$RJPatientModelCopyWithImpl(this._value, this._then);

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
    Object? religion = freezed,
    Object? birthPlace = freezed,
    Object? addressDomicile = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? job = freezed,
    Object? bloodType = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? education = freezed,
    Object? noKTP = freezed,
    Object? paymentMethod = freezed,
    Object? family = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? idUsers = freezed,
    Object? ihsId = freezed,
    Object? hp = freezed,
    Object? isGenerateMrCode = freezed,
    Object? motherName = freezed,
    Object? medicalHistory = freezed,
    Object? allergicHistory = freezed,
    Object? medicineHistory = freezed,
    Object? isTemporary = freezed,
    Object? isMedicaboo = freezed,
    Object? patientIhsId = freezed,
    Object? profilePicture = freezed,
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
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      birthPlace: freezed == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDomicile: freezed == addressDomicile
          ? _value.addressDomicile
          : addressDomicile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      noKTP: freezed == noKTP
          ? _value.noKTP
          : noKTP // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodModel>?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as List<FamilyModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idUsers: freezed == idUsers
          ? _value.idUsers
          : idUsers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ihsId: freezed == ihsId
          ? _value.ihsId
          : ihsId // ignore: cast_nullable_to_non_nullable
              as String?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      isGenerateMrCode: freezed == isGenerateMrCode
          ? _value.isGenerateMrCode
          : isGenerateMrCode // ignore: cast_nullable_to_non_nullable
              as bool?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalHistory: freezed == medicalHistory
          ? _value.medicalHistory
          : medicalHistory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allergicHistory: freezed == allergicHistory
          ? _value.allergicHistory
          : allergicHistory // ignore: cast_nullable_to_non_nullable
              as List<AllergicHistoryModel>?,
      medicineHistory: freezed == medicineHistory
          ? _value.medicineHistory
          : medicineHistory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isTemporary: freezed == isTemporary
          ? _value.isTemporary
          : isTemporary // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMedicaboo: freezed == isMedicaboo
          ? _value.isMedicaboo
          : isMedicaboo // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientIhsId: freezed == patientIhsId
          ? _value.patientIhsId
          : patientIhsId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RJPatientModelImplCopyWith<$Res>
    implements $RJPatientModelCopyWith<$Res> {
  factory _$$RJPatientModelImplCopyWith(_$RJPatientModelImpl value,
          $Res Function(_$RJPatientModelImpl) then) =
      __$$RJPatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nama,
      int? gender,
      String? tanggalLahir,
      List<PHModel>? ph,
      String? religion,
      @JsonKey(name: 'birth_place') String? birthPlace,
      @JsonKey(name: 'address_domicile') String? addressDomicile,
      @JsonKey(fromJson: addressFromJson) AddressModel? address,
      String? status,
      String? job,
      @JsonKey(name: 'blood_type') String? bloodType,
      String? phone,
      String? email,
      String? education,
      String? noKTP,
      List<PaymentMethodModel>? paymentMethod,
      List<FamilyModel>? family,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'created_id') String? createdId,
      @JsonKey(name: 'updated_at') String? updatedAt,
      String? id,
      @JsonKey(name: 'id_users') List<String>? idUsers,
      String? ihsId,
      String? hp,
      bool? isGenerateMrCode,
      String? motherName,
      List<String>? medicalHistory,
      List<AllergicHistoryModel>? allergicHistory,
      List<dynamic>? medicineHistory,
      bool? isTemporary,
      @JsonKey(name: 'is_medicaboo') bool? isMedicaboo,
      String? patientIhsId,
      String? profilePicture});

  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$RJPatientModelImplCopyWithImpl<$Res>
    extends _$RJPatientModelCopyWithImpl<$Res, _$RJPatientModelImpl>
    implements _$$RJPatientModelImplCopyWith<$Res> {
  __$$RJPatientModelImplCopyWithImpl(
      _$RJPatientModelImpl _value, $Res Function(_$RJPatientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = freezed,
    Object? gender = freezed,
    Object? tanggalLahir = freezed,
    Object? ph = freezed,
    Object? religion = freezed,
    Object? birthPlace = freezed,
    Object? addressDomicile = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? job = freezed,
    Object? bloodType = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? education = freezed,
    Object? noKTP = freezed,
    Object? paymentMethod = freezed,
    Object? family = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? idUsers = freezed,
    Object? ihsId = freezed,
    Object? hp = freezed,
    Object? isGenerateMrCode = freezed,
    Object? motherName = freezed,
    Object? medicalHistory = freezed,
    Object? allergicHistory = freezed,
    Object? medicineHistory = freezed,
    Object? isTemporary = freezed,
    Object? isMedicaboo = freezed,
    Object? patientIhsId = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$RJPatientModelImpl(
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
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      birthPlace: freezed == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDomicile: freezed == addressDomicile
          ? _value.addressDomicile
          : addressDomicile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      noKTP: freezed == noKTP
          ? _value.noKTP
          : noKTP // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value._paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodModel>?,
      family: freezed == family
          ? _value._family
          : family // ignore: cast_nullable_to_non_nullable
              as List<FamilyModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idUsers: freezed == idUsers
          ? _value._idUsers
          : idUsers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ihsId: freezed == ihsId
          ? _value.ihsId
          : ihsId // ignore: cast_nullable_to_non_nullable
              as String?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      isGenerateMrCode: freezed == isGenerateMrCode
          ? _value.isGenerateMrCode
          : isGenerateMrCode // ignore: cast_nullable_to_non_nullable
              as bool?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalHistory: freezed == medicalHistory
          ? _value._medicalHistory
          : medicalHistory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allergicHistory: freezed == allergicHistory
          ? _value._allergicHistory
          : allergicHistory // ignore: cast_nullable_to_non_nullable
              as List<AllergicHistoryModel>?,
      medicineHistory: freezed == medicineHistory
          ? _value._medicineHistory
          : medicineHistory // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isTemporary: freezed == isTemporary
          ? _value.isTemporary
          : isTemporary // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMedicaboo: freezed == isMedicaboo
          ? _value.isMedicaboo
          : isMedicaboo // ignore: cast_nullable_to_non_nullable
              as bool?,
      patientIhsId: freezed == patientIhsId
          ? _value.patientIhsId
          : patientIhsId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RJPatientModelImpl implements _RJPatientModel {
  const _$RJPatientModelImpl(
      {this.nama,
      this.gender,
      this.tanggalLahir,
      final List<PHModel>? ph,
      this.religion,
      @JsonKey(name: 'birth_place') this.birthPlace,
      @JsonKey(name: 'address_domicile') this.addressDomicile,
      @JsonKey(fromJson: addressFromJson) this.address,
      this.status,
      this.job,
      @JsonKey(name: 'blood_type') this.bloodType,
      this.phone,
      this.email,
      this.education,
      this.noKTP,
      final List<PaymentMethodModel>? paymentMethod,
      final List<FamilyModel>? family,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_id') this.createdId,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.id,
      @JsonKey(name: 'id_users') final List<String>? idUsers,
      this.ihsId,
      this.hp,
      this.isGenerateMrCode,
      this.motherName,
      final List<String>? medicalHistory,
      final List<AllergicHistoryModel>? allergicHistory,
      final List<dynamic>? medicineHistory,
      this.isTemporary,
      @JsonKey(name: 'is_medicaboo') this.isMedicaboo,
      this.patientIhsId,
      this.profilePicture})
      : _ph = ph,
        _paymentMethod = paymentMethod,
        _family = family,
        _idUsers = idUsers,
        _medicalHistory = medicalHistory,
        _allergicHistory = allergicHistory,
        _medicineHistory = medicineHistory;

  factory _$RJPatientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RJPatientModelImplFromJson(json);

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
  final String? religion;
  @override
  @JsonKey(name: 'birth_place')
  final String? birthPlace;
  @override
  @JsonKey(name: 'address_domicile')
  final String? addressDomicile;
  @override
  @JsonKey(fromJson: addressFromJson)
  final AddressModel? address;
  @override
  final String? status;
  @override
  final String? job;
  @override
  @JsonKey(name: 'blood_type')
  final String? bloodType;
  @override
  final String? phone;
  @override
  final String? email;
// @JsonKey(name: 'id_ext') String? idExt,
  @override
  final String? education;
// bool? isShareMr,
  @override
  final String? noKTP;
  final List<PaymentMethodModel>? _paymentMethod;
  @override
  List<PaymentMethodModel>? get paymentMethod {
    final value = _paymentMethod;
    if (value == null) return null;
    if (_paymentMethod is EqualUnmodifiableListView) return _paymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FamilyModel>? _family;
  @override
  List<FamilyModel>? get family {
    final value = _family;
    if (value == null) return null;
    if (_family is EqualUnmodifiableListView) return _family;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// BpjsInfo? bpjsInfo,
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'created_id')
  final String? createdId;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
// bool? isNew,
// bool? isDeleted,
  @override
  final String? id;
  final List<String>? _idUsers;
  @override
  @JsonKey(name: 'id_users')
  List<String>? get idUsers {
    final value = _idUsers;
    if (value == null) return null;
    if (_idUsers is EqualUnmodifiableListView) return _idUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ihsId;
  @override
  final String? hp;
// CompanyInfo? companyInfo,
  @override
  final bool? isGenerateMrCode;
  @override
  final String? motherName;
  final List<String>? _medicalHistory;
  @override
  List<String>? get medicalHistory {
    final value = _medicalHistory;
    if (value == null) return null;
    if (_medicalHistory is EqualUnmodifiableListView) return _medicalHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AllergicHistoryModel>? _allergicHistory;
  @override
  List<AllergicHistoryModel>? get allergicHistory {
    final value = _allergicHistory;
    if (value == null) return null;
    if (_allergicHistory is EqualUnmodifiableListView) return _allergicHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// List<MedicalHistoryFamily>? medicalHistoryFamily,
  final List<dynamic>? _medicineHistory;
// List<MedicalHistoryFamily>? medicalHistoryFamily,
  @override
  List<dynamic>? get medicineHistory {
    final value = _medicineHistory;
    if (value == null) return null;
    if (_medicineHistory is EqualUnmodifiableListView) return _medicineHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isTemporary;
  @override
  @JsonKey(name: 'is_medicaboo')
  final bool? isMedicaboo;
// bool? isOA,
  @override
  final String? patientIhsId;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'RJPatientModel(nama: $nama, gender: $gender, tanggalLahir: $tanggalLahir, ph: $ph, religion: $religion, birthPlace: $birthPlace, addressDomicile: $addressDomicile, address: $address, status: $status, job: $job, bloodType: $bloodType, phone: $phone, email: $email, education: $education, noKTP: $noKTP, paymentMethod: $paymentMethod, family: $family, createdAt: $createdAt, createdId: $createdId, updatedAt: $updatedAt, id: $id, idUsers: $idUsers, ihsId: $ihsId, hp: $hp, isGenerateMrCode: $isGenerateMrCode, motherName: $motherName, medicalHistory: $medicalHistory, allergicHistory: $allergicHistory, medicineHistory: $medicineHistory, isTemporary: $isTemporary, isMedicaboo: $isMedicaboo, patientIhsId: $patientIhsId, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RJPatientModelImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.tanggalLahir, tanggalLahir) ||
                other.tanggalLahir == tanggalLahir) &&
            const DeepCollectionEquality().equals(other._ph, _ph) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.addressDomicile, addressDomicile) ||
                other.addressDomicile == addressDomicile) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.noKTP, noKTP) || other.noKTP == noKTP) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethod, _paymentMethod) &&
            const DeepCollectionEquality().equals(other._family, _family) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._idUsers, _idUsers) &&
            (identical(other.ihsId, ihsId) || other.ihsId == ihsId) &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.isGenerateMrCode, isGenerateMrCode) ||
                other.isGenerateMrCode == isGenerateMrCode) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            const DeepCollectionEquality()
                .equals(other._medicalHistory, _medicalHistory) &&
            const DeepCollectionEquality()
                .equals(other._allergicHistory, _allergicHistory) &&
            const DeepCollectionEquality()
                .equals(other._medicineHistory, _medicineHistory) &&
            (identical(other.isTemporary, isTemporary) ||
                other.isTemporary == isTemporary) &&
            (identical(other.isMedicaboo, isMedicaboo) ||
                other.isMedicaboo == isMedicaboo) &&
            (identical(other.patientIhsId, patientIhsId) ||
                other.patientIhsId == patientIhsId) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        nama,
        gender,
        tanggalLahir,
        const DeepCollectionEquality().hash(_ph),
        religion,
        birthPlace,
        addressDomicile,
        address,
        status,
        job,
        bloodType,
        phone,
        email,
        education,
        noKTP,
        const DeepCollectionEquality().hash(_paymentMethod),
        const DeepCollectionEquality().hash(_family),
        createdAt,
        createdId,
        updatedAt,
        id,
        const DeepCollectionEquality().hash(_idUsers),
        ihsId,
        hp,
        isGenerateMrCode,
        motherName,
        const DeepCollectionEquality().hash(_medicalHistory),
        const DeepCollectionEquality().hash(_allergicHistory),
        const DeepCollectionEquality().hash(_medicineHistory),
        isTemporary,
        isMedicaboo,
        patientIhsId,
        profilePicture
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RJPatientModelImplCopyWith<_$RJPatientModelImpl> get copyWith =>
      __$$RJPatientModelImplCopyWithImpl<_$RJPatientModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RJPatientModelImplToJson(
      this,
    );
  }
}

abstract class _RJPatientModel implements RJPatientModel {
  const factory _RJPatientModel(
      {final String? nama,
      final int? gender,
      final String? tanggalLahir,
      final List<PHModel>? ph,
      final String? religion,
      @JsonKey(name: 'birth_place') final String? birthPlace,
      @JsonKey(name: 'address_domicile') final String? addressDomicile,
      @JsonKey(fromJson: addressFromJson) final AddressModel? address,
      final String? status,
      final String? job,
      @JsonKey(name: 'blood_type') final String? bloodType,
      final String? phone,
      final String? email,
      final String? education,
      final String? noKTP,
      final List<PaymentMethodModel>? paymentMethod,
      final List<FamilyModel>? family,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'created_id') final String? createdId,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final String? id,
      @JsonKey(name: 'id_users') final List<String>? idUsers,
      final String? ihsId,
      final String? hp,
      final bool? isGenerateMrCode,
      final String? motherName,
      final List<String>? medicalHistory,
      final List<AllergicHistoryModel>? allergicHistory,
      final List<dynamic>? medicineHistory,
      final bool? isTemporary,
      @JsonKey(name: 'is_medicaboo') final bool? isMedicaboo,
      final String? patientIhsId,
      final String? profilePicture}) = _$RJPatientModelImpl;

  factory _RJPatientModel.fromJson(Map<String, dynamic> json) =
      _$RJPatientModelImpl.fromJson;

  @override
  String? get nama;
  @override
  int? get gender;
  @override
  String? get tanggalLahir;
  @override
  List<PHModel>? get ph;
  @override
  String? get religion;
  @override
  @JsonKey(name: 'birth_place')
  String? get birthPlace;
  @override
  @JsonKey(name: 'address_domicile')
  String? get addressDomicile;
  @override
  @JsonKey(fromJson: addressFromJson)
  AddressModel? get address;
  @override
  String? get status;
  @override
  String? get job;
  @override
  @JsonKey(name: 'blood_type')
  String? get bloodType;
  @override
  String? get phone;
  @override
  String? get email;
  @override // @JsonKey(name: 'id_ext') String? idExt,
  String? get education;
  @override // bool? isShareMr,
  String? get noKTP;
  @override
  List<PaymentMethodModel>? get paymentMethod;
  @override
  List<FamilyModel>? get family;
  @override // BpjsInfo? bpjsInfo,
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'created_id')
  String? get createdId;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override // bool? isNew,
// bool? isDeleted,
  String? get id;
  @override
  @JsonKey(name: 'id_users')
  List<String>? get idUsers;
  @override
  String? get ihsId;
  @override
  String? get hp;
  @override // CompanyInfo? companyInfo,
  bool? get isGenerateMrCode;
  @override
  String? get motherName;
  @override
  List<String>? get medicalHistory;
  @override
  List<AllergicHistoryModel>? get allergicHistory;
  @override // List<MedicalHistoryFamily>? medicalHistoryFamily,
  List<dynamic>? get medicineHistory;
  @override
  bool? get isTemporary;
  @override
  @JsonKey(name: 'is_medicaboo')
  bool? get isMedicaboo;
  @override // bool? isOA,
  String? get patientIhsId;
  @override
  String? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$RJPatientModelImplCopyWith<_$RJPatientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
