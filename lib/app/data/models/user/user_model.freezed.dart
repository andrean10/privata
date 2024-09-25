// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get email => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  bool? get notifSubscribe => throw _privateConstructorUsedError;
  String? get hp => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError; // dynamic data,
  @JsonKey(name: 'is_partner')
  bool? get isPartner => throw _privateConstructorUsedError;
  bool? get isNeedChangePassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login')
  String? get lastLogin => throw _privateConstructorUsedError;
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  String? get lastChangePassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_date')
  String? get createdDate => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get employeeNo => throw _privateConstructorUsedError;
  String? get uniqueCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Links')
  List<LinksModel>? get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? email,
      bool? emailVerified,
      bool? notifSubscribe,
      String? hp,
      String? nama,
      String? platform,
      String? id,
      @JsonKey(name: 'is_partner') bool? isPartner,
      bool? isNeedChangePassword,
      @JsonKey(name: 'last_login') String? lastLogin,
      bool? isPhoneVerified,
      String? lastChangePassword,
      @JsonKey(name: 'created_date') String? createdDate,
      String? occupation,
      String? employeeNo,
      String? uniqueCode,
      @JsonKey(name: 'Links') List<LinksModel>? links});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? notifSubscribe = freezed,
    Object? hp = freezed,
    Object? nama = freezed,
    Object? platform = freezed,
    Object? id = freezed,
    Object? isPartner = freezed,
    Object? isNeedChangePassword = freezed,
    Object? lastLogin = freezed,
    Object? isPhoneVerified = freezed,
    Object? lastChangePassword = freezed,
    Object? createdDate = freezed,
    Object? occupation = freezed,
    Object? employeeNo = freezed,
    Object? uniqueCode = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifSubscribe: freezed == notifSubscribe
          ? _value.notifSubscribe
          : notifSubscribe // ignore: cast_nullable_to_non_nullable
              as bool?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isPartner: freezed == isPartner
          ? _value.isPartner
          : isPartner // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedChangePassword: freezed == isNeedChangePassword
          ? _value.isNeedChangePassword
          : isNeedChangePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastChangePassword: freezed == lastChangePassword
          ? _value.lastChangePassword
          : lastChangePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNo: freezed == employeeNo
          ? _value.employeeNo
          : employeeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinksModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      bool? emailVerified,
      bool? notifSubscribe,
      String? hp,
      String? nama,
      String? platform,
      String? id,
      @JsonKey(name: 'is_partner') bool? isPartner,
      bool? isNeedChangePassword,
      @JsonKey(name: 'last_login') String? lastLogin,
      bool? isPhoneVerified,
      String? lastChangePassword,
      @JsonKey(name: 'created_date') String? createdDate,
      String? occupation,
      String? employeeNo,
      String? uniqueCode,
      @JsonKey(name: 'Links') List<LinksModel>? links});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? notifSubscribe = freezed,
    Object? hp = freezed,
    Object? nama = freezed,
    Object? platform = freezed,
    Object? id = freezed,
    Object? isPartner = freezed,
    Object? isNeedChangePassword = freezed,
    Object? lastLogin = freezed,
    Object? isPhoneVerified = freezed,
    Object? lastChangePassword = freezed,
    Object? createdDate = freezed,
    Object? occupation = freezed,
    Object? employeeNo = freezed,
    Object? uniqueCode = freezed,
    Object? links = freezed,
  }) {
    return _then(_$UserModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifSubscribe: freezed == notifSubscribe
          ? _value.notifSubscribe
          : notifSubscribe // ignore: cast_nullable_to_non_nullable
              as bool?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isPartner: freezed == isPartner
          ? _value.isPartner
          : isPartner // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedChangePassword: freezed == isNeedChangePassword
          ? _value.isNeedChangePassword
          : isNeedChangePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastChangePassword: freezed == lastChangePassword
          ? _value.lastChangePassword
          : lastChangePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNo: freezed == employeeNo
          ? _value.employeeNo
          : employeeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinksModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.email,
      this.emailVerified,
      this.notifSubscribe,
      this.hp,
      this.nama,
      this.platform,
      this.id,
      @JsonKey(name: 'is_partner') this.isPartner,
      this.isNeedChangePassword,
      @JsonKey(name: 'last_login') this.lastLogin,
      this.isPhoneVerified,
      this.lastChangePassword,
      @JsonKey(name: 'created_date') this.createdDate,
      this.occupation,
      this.employeeNo,
      this.uniqueCode,
      @JsonKey(name: 'Links') final List<LinksModel>? links})
      : _links = links;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? email;
  @override
  final bool? emailVerified;
  @override
  final bool? notifSubscribe;
  @override
  final String? hp;
  @override
  final String? nama;
  @override
  final String? platform;
  @override
  final String? id;
// dynamic data,
  @override
  @JsonKey(name: 'is_partner')
  final bool? isPartner;
  @override
  final bool? isNeedChangePassword;
  @override
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  @override
  final bool? isPhoneVerified;
  @override
  final String? lastChangePassword;
  @override
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @override
  final String? occupation;
  @override
  final String? employeeNo;
  @override
  final String? uniqueCode;
  final List<LinksModel>? _links;
  @override
  @JsonKey(name: 'Links')
  List<LinksModel>? get links {
    final value = _links;
    if (value == null) return null;
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(email: $email, emailVerified: $emailVerified, notifSubscribe: $notifSubscribe, hp: $hp, nama: $nama, platform: $platform, id: $id, isPartner: $isPartner, isNeedChangePassword: $isNeedChangePassword, lastLogin: $lastLogin, isPhoneVerified: $isPhoneVerified, lastChangePassword: $lastChangePassword, createdDate: $createdDate, occupation: $occupation, employeeNo: $employeeNo, uniqueCode: $uniqueCode, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.notifSubscribe, notifSubscribe) ||
                other.notifSubscribe == notifSubscribe) &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPartner, isPartner) ||
                other.isPartner == isPartner) &&
            (identical(other.isNeedChangePassword, isNeedChangePassword) ||
                other.isNeedChangePassword == isNeedChangePassword) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.lastChangePassword, lastChangePassword) ||
                other.lastChangePassword == lastChangePassword) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.employeeNo, employeeNo) ||
                other.employeeNo == employeeNo) &&
            (identical(other.uniqueCode, uniqueCode) ||
                other.uniqueCode == uniqueCode) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      emailVerified,
      notifSubscribe,
      hp,
      nama,
      platform,
      id,
      isPartner,
      isNeedChangePassword,
      lastLogin,
      isPhoneVerified,
      lastChangePassword,
      createdDate,
      occupation,
      employeeNo,
      uniqueCode,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? email,
      final bool? emailVerified,
      final bool? notifSubscribe,
      final String? hp,
      final String? nama,
      final String? platform,
      final String? id,
      @JsonKey(name: 'is_partner') final bool? isPartner,
      final bool? isNeedChangePassword,
      @JsonKey(name: 'last_login') final String? lastLogin,
      final bool? isPhoneVerified,
      final String? lastChangePassword,
      @JsonKey(name: 'created_date') final String? createdDate,
      final String? occupation,
      final String? employeeNo,
      final String? uniqueCode,
      @JsonKey(name: 'Links') final List<LinksModel>? links}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get email;
  @override
  bool? get emailVerified;
  @override
  bool? get notifSubscribe;
  @override
  String? get hp;
  @override
  String? get nama;
  @override
  String? get platform;
  @override
  String? get id;
  @override // dynamic data,
  @JsonKey(name: 'is_partner')
  bool? get isPartner;
  @override
  bool? get isNeedChangePassword;
  @override
  @JsonKey(name: 'last_login')
  String? get lastLogin;
  @override
  bool? get isPhoneVerified;
  @override
  String? get lastChangePassword;
  @override
  @JsonKey(name: 'created_date')
  String? get createdDate;
  @override
  String? get occupation;
  @override
  String? get employeeNo;
  @override
  String? get uniqueCode;
  @override
  @JsonKey(name: 'Links')
  List<LinksModel>? get links;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
