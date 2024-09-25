// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return _RegisterModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterModel {
  @JsonKey(name: 'Links')
  List<LinksModel>? get links => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  String? get hp => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res, RegisterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Links') List<LinksModel>? links,
      String? email,
      int? gender,
      String? hp,
      String? nama,
      String? password,
      String? username,
      String? from});
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res, $Val extends RegisterModel>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? hp = freezed,
    Object? nama = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? from = freezed,
  }) {
    return _then(_value.copyWith(
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinksModel>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterModelImplCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$RegisterModelImplCopyWith(
          _$RegisterModelImpl value, $Res Function(_$RegisterModelImpl) then) =
      __$$RegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Links') List<LinksModel>? links,
      String? email,
      int? gender,
      String? hp,
      String? nama,
      String? password,
      String? username,
      String? from});
}

/// @nodoc
class __$$RegisterModelImplCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res, _$RegisterModelImpl>
    implements _$$RegisterModelImplCopyWith<$Res> {
  __$$RegisterModelImplCopyWithImpl(
      _$RegisterModelImpl _value, $Res Function(_$RegisterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? hp = freezed,
    Object? nama = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? from = freezed,
  }) {
    return _then(_$RegisterModelImpl(
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinksModel>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      hp: freezed == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterModelImpl implements _RegisterModel {
  const _$RegisterModelImpl(
      {@JsonKey(name: 'Links') final List<LinksModel>? links,
      this.email,
      this.gender,
      this.hp,
      this.nama,
      this.password,
      this.username,
      this.from})
      : _links = links;

  factory _$RegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterModelImplFromJson(json);

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
  final String? email;
  @override
  final int? gender;
  @override
  final String? hp;
  @override
  final String? nama;
  @override
  final String? password;
  @override
  final String? username;
  @override
  final String? from;

  @override
  String toString() {
    return 'RegisterModel(links: $links, email: $email, gender: $gender, hp: $hp, nama: $nama, password: $password, username: $username, from: $from)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterModelImpl &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_links),
      email,
      gender,
      hp,
      nama,
      password,
      username,
      from);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      __$$RegisterModelImplCopyWithImpl<_$RegisterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterModel implements RegisterModel {
  const factory _RegisterModel(
      {@JsonKey(name: 'Links') final List<LinksModel>? links,
      final String? email,
      final int? gender,
      final String? hp,
      final String? nama,
      final String? password,
      final String? username,
      final String? from}) = _$RegisterModelImpl;

  factory _RegisterModel.fromJson(Map<String, dynamic> json) =
      _$RegisterModelImpl.fromJson;

  @override
  @JsonKey(name: 'Links')
  List<LinksModel>? get links;
  @override
  String? get email;
  @override
  int? get gender;
  @override
  String? get hp;
  @override
  String? get nama;
  @override
  String? get password;
  @override
  String? get username;
  @override
  String? get from;
  @override
  @JsonKey(ignore: true)
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
