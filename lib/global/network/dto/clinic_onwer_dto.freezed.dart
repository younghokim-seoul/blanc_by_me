// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinic_onwer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClinicInfoData _$ClinicInfoDataFromJson(Map<String, dynamic> json) {
  return _ClinicInfoData.fromJson(json);
}

/// @nodoc
mixin _$ClinicInfoData {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  bool get confirmed => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get deleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_onwer')
  ClinicOnwerData? get clinicOwner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicInfoDataCopyWith<ClinicInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicInfoDataCopyWith<$Res> {
  factory $ClinicInfoDataCopyWith(
          ClinicInfoData value, $Res Function(ClinicInfoData) then) =
      _$ClinicInfoDataCopyWithImpl<$Res, ClinicInfoData>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? email,
      String? provider,
      bool confirmed,
      bool blocked,
      String? createdAt,
      String? updatedAt,
      bool? deleted,
      @JsonKey(name: 'clinic_onwer') ClinicOnwerData? clinicOwner});

  $ClinicOnwerDataCopyWith<$Res>? get clinicOwner;
}

/// @nodoc
class _$ClinicInfoDataCopyWithImpl<$Res, $Val extends ClinicInfoData>
    implements $ClinicInfoDataCopyWith<$Res> {
  _$ClinicInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? confirmed = null,
    Object? blocked = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
    Object? clinicOwner = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      clinicOwner: freezed == clinicOwner
          ? _value.clinicOwner
          : clinicOwner // ignore: cast_nullable_to_non_nullable
              as ClinicOnwerData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClinicOnwerDataCopyWith<$Res>? get clinicOwner {
    if (_value.clinicOwner == null) {
      return null;
    }

    return $ClinicOnwerDataCopyWith<$Res>(_value.clinicOwner!, (value) {
      return _then(_value.copyWith(clinicOwner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicInfoDataImplCopyWith<$Res>
    implements $ClinicInfoDataCopyWith<$Res> {
  factory _$$ClinicInfoDataImplCopyWith(_$ClinicInfoDataImpl value,
          $Res Function(_$ClinicInfoDataImpl) then) =
      __$$ClinicInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? email,
      String? provider,
      bool confirmed,
      bool blocked,
      String? createdAt,
      String? updatedAt,
      bool? deleted,
      @JsonKey(name: 'clinic_onwer') ClinicOnwerData? clinicOwner});

  @override
  $ClinicOnwerDataCopyWith<$Res>? get clinicOwner;
}

/// @nodoc
class __$$ClinicInfoDataImplCopyWithImpl<$Res>
    extends _$ClinicInfoDataCopyWithImpl<$Res, _$ClinicInfoDataImpl>
    implements _$$ClinicInfoDataImplCopyWith<$Res> {
  __$$ClinicInfoDataImplCopyWithImpl(
      _$ClinicInfoDataImpl _value, $Res Function(_$ClinicInfoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? confirmed = null,
    Object? blocked = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = freezed,
    Object? clinicOwner = freezed,
  }) {
    return _then(_$ClinicInfoDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      clinicOwner: freezed == clinicOwner
          ? _value.clinicOwner
          : clinicOwner // ignore: cast_nullable_to_non_nullable
              as ClinicOnwerData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicInfoDataImpl implements _ClinicInfoData {
  const _$ClinicInfoDataImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.provider,
      required this.confirmed,
      required this.blocked,
      required this.createdAt,
      required this.updatedAt,
      required this.deleted,
      @JsonKey(name: 'clinic_onwer') required this.clinicOwner});

  factory _$ClinicInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicInfoDataImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? provider;
  @override
  final bool confirmed;
  @override
  final bool blocked;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final bool? deleted;
  @override
  @JsonKey(name: 'clinic_onwer')
  final ClinicOnwerData? clinicOwner;

  @override
  String toString() {
    return 'ClinicInfoData(id: $id, name: $name, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, clinicOwner: $clinicOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicInfoDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.clinicOwner, clinicOwner) ||
                other.clinicOwner == clinicOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, provider,
      confirmed, blocked, createdAt, updatedAt, deleted, clinicOwner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicInfoDataImplCopyWith<_$ClinicInfoDataImpl> get copyWith =>
      __$$ClinicInfoDataImplCopyWithImpl<_$ClinicInfoDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicInfoDataImplToJson(
      this,
    );
  }
}

abstract class _ClinicInfoData implements ClinicInfoData {
  const factory _ClinicInfoData(
      {required final int id,
      required final String? name,
      required final String? email,
      required final String? provider,
      required final bool confirmed,
      required final bool blocked,
      required final String? createdAt,
      required final String? updatedAt,
      required final bool? deleted,
      @JsonKey(name: 'clinic_onwer')
      required final ClinicOnwerData? clinicOwner}) = _$ClinicInfoDataImpl;

  factory _ClinicInfoData.fromJson(Map<String, dynamic> json) =
      _$ClinicInfoDataImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get provider;
  @override
  bool get confirmed;
  @override
  bool get blocked;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  bool? get deleted;
  @override
  @JsonKey(name: 'clinic_onwer')
  ClinicOnwerData? get clinicOwner;
  @override
  @JsonKey(ignore: true)
  _$$ClinicInfoDataImplCopyWith<_$ClinicInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicOnwerData _$ClinicOnwerDataFromJson(Map<String, dynamic> json) {
  return _ClinicOnwerData.fromJson(json);
}

/// @nodoc
mixin _$ClinicOnwerData {
  int get id => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic')
  ClinicData? get clinicData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicOnwerDataCopyWith<ClinicOnwerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicOnwerDataCopyWith<$Res> {
  factory $ClinicOnwerDataCopyWith(
          ClinicOnwerData value, $Res Function(ClinicOnwerData) then) =
      _$ClinicOnwerDataCopyWithImpl<$Res, ClinicOnwerData>;
  @useResult
  $Res call(
      {int id,
      String? memo,
      String? createdAt,
      String? updatedAt,
      @JsonKey(name: 'clinic') ClinicData? clinicData});

  $ClinicDataCopyWith<$Res>? get clinicData;
}

/// @nodoc
class _$ClinicOnwerDataCopyWithImpl<$Res, $Val extends ClinicOnwerData>
    implements $ClinicOnwerDataCopyWith<$Res> {
  _$ClinicOnwerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? clinicData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicData: freezed == clinicData
          ? _value.clinicData
          : clinicData // ignore: cast_nullable_to_non_nullable
              as ClinicData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClinicDataCopyWith<$Res>? get clinicData {
    if (_value.clinicData == null) {
      return null;
    }

    return $ClinicDataCopyWith<$Res>(_value.clinicData!, (value) {
      return _then(_value.copyWith(clinicData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClinicOnwerDataImplCopyWith<$Res>
    implements $ClinicOnwerDataCopyWith<$Res> {
  factory _$$ClinicOnwerDataImplCopyWith(_$ClinicOnwerDataImpl value,
          $Res Function(_$ClinicOnwerDataImpl) then) =
      __$$ClinicOnwerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? memo,
      String? createdAt,
      String? updatedAt,
      @JsonKey(name: 'clinic') ClinicData? clinicData});

  @override
  $ClinicDataCopyWith<$Res>? get clinicData;
}

/// @nodoc
class __$$ClinicOnwerDataImplCopyWithImpl<$Res>
    extends _$ClinicOnwerDataCopyWithImpl<$Res, _$ClinicOnwerDataImpl>
    implements _$$ClinicOnwerDataImplCopyWith<$Res> {
  __$$ClinicOnwerDataImplCopyWithImpl(
      _$ClinicOnwerDataImpl _value, $Res Function(_$ClinicOnwerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? clinicData = freezed,
  }) {
    return _then(_$ClinicOnwerDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicData: freezed == clinicData
          ? _value.clinicData
          : clinicData // ignore: cast_nullable_to_non_nullable
              as ClinicData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicOnwerDataImpl implements _ClinicOnwerData {
  const _$ClinicOnwerDataImpl(
      {required this.id,
      required this.memo,
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(name: 'clinic') required this.clinicData});

  factory _$ClinicOnwerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicOnwerDataImplFromJson(json);

  @override
  final int id;
  @override
  final String? memo;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  @JsonKey(name: 'clinic')
  final ClinicData? clinicData;

  @override
  String toString() {
    return 'ClinicOnwerData(id: $id, memo: $memo, createdAt: $createdAt, updatedAt: $updatedAt, clinicData: $clinicData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicOnwerDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.clinicData, clinicData) ||
                other.clinicData == clinicData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, memo, createdAt, updatedAt, clinicData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicOnwerDataImplCopyWith<_$ClinicOnwerDataImpl> get copyWith =>
      __$$ClinicOnwerDataImplCopyWithImpl<_$ClinicOnwerDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicOnwerDataImplToJson(
      this,
    );
  }
}

abstract class _ClinicOnwerData implements ClinicOnwerData {
  const factory _ClinicOnwerData(
          {required final int id,
          required final String? memo,
          required final String? createdAt,
          required final String? updatedAt,
          @JsonKey(name: 'clinic') required final ClinicData? clinicData}) =
      _$ClinicOnwerDataImpl;

  factory _ClinicOnwerData.fromJson(Map<String, dynamic> json) =
      _$ClinicOnwerDataImpl.fromJson;

  @override
  int get id;
  @override
  String? get memo;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(name: 'clinic')
  ClinicData? get clinicData;
  @override
  @JsonKey(ignore: true)
  _$$ClinicOnwerDataImplCopyWith<_$ClinicOnwerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicData _$ClinicDataFromJson(Map<String, dynamic> json) {
  return _ClinicData.fromJson(json);
}

/// @nodoc
mixin _$ClinicData {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get businessNumber => throw _privateConstructorUsedError;
  String? get taxEmail => throw _privateConstructorUsedError;
  String? get licenseNumber => throw _privateConstructorUsedError;
  String? get officePhone => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicDataCopyWith<ClinicData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDataCopyWith<$Res> {
  factory $ClinicDataCopyWith(
          ClinicData value, $Res Function(ClinicData) then) =
      _$ClinicDataCopyWithImpl<$Res, ClinicData>;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? businessNumber,
      String? taxEmail,
      String? licenseNumber,
      String? officePhone,
      String? address2,
      String? lat,
      String? lon,
      String? createdAt,
      String? updatedAt,
      String? postcode,
      String? address});
}

/// @nodoc
class _$ClinicDataCopyWithImpl<$Res, $Val extends ClinicData>
    implements $ClinicDataCopyWith<$Res> {
  _$ClinicDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? businessNumber = freezed,
    Object? taxEmail = freezed,
    Object? licenseNumber = freezed,
    Object? officePhone = freezed,
    Object? address2 = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? postcode = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      businessNumber: freezed == businessNumber
          ? _value.businessNumber
          : businessNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      taxEmail: freezed == taxEmail
          ? _value.taxEmail
          : taxEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      officePhone: freezed == officePhone
          ? _value.officePhone
          : officePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClinicDataImplCopyWith<$Res>
    implements $ClinicDataCopyWith<$Res> {
  factory _$$ClinicDataImplCopyWith(
          _$ClinicDataImpl value, $Res Function(_$ClinicDataImpl) then) =
      __$$ClinicDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? businessNumber,
      String? taxEmail,
      String? licenseNumber,
      String? officePhone,
      String? address2,
      String? lat,
      String? lon,
      String? createdAt,
      String? updatedAt,
      String? postcode,
      String? address});
}

/// @nodoc
class __$$ClinicDataImplCopyWithImpl<$Res>
    extends _$ClinicDataCopyWithImpl<$Res, _$ClinicDataImpl>
    implements _$$ClinicDataImplCopyWith<$Res> {
  __$$ClinicDataImplCopyWithImpl(
      _$ClinicDataImpl _value, $Res Function(_$ClinicDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? businessNumber = freezed,
    Object? taxEmail = freezed,
    Object? licenseNumber = freezed,
    Object? officePhone = freezed,
    Object? address2 = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? postcode = freezed,
    Object? address = freezed,
  }) {
    return _then(_$ClinicDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      businessNumber: freezed == businessNumber
          ? _value.businessNumber
          : businessNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      taxEmail: freezed == taxEmail
          ? _value.taxEmail
          : taxEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      officePhone: freezed == officePhone
          ? _value.officePhone
          : officePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDataImpl implements _ClinicData {
  const _$ClinicDataImpl(
      {required this.id,
      required this.name,
      required this.businessNumber,
      required this.taxEmail,
      required this.licenseNumber,
      required this.officePhone,
      required this.address2,
      required this.lat,
      required this.lon,
      required this.createdAt,
      required this.updatedAt,
      required this.postcode,
      required this.address});

  factory _$ClinicDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDataImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? businessNumber;
  @override
  final String? taxEmail;
  @override
  final String? licenseNumber;
  @override
  final String? officePhone;
  @override
  final String? address2;
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? postcode;
  @override
  final String? address;

  @override
  String toString() {
    return 'ClinicData(id: $id, name: $name, businessNumber: $businessNumber, taxEmail: $taxEmail, licenseNumber: $licenseNumber, officePhone: $officePhone, address2: $address2, lat: $lat, lon: $lon, createdAt: $createdAt, updatedAt: $updatedAt, postcode: $postcode, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.businessNumber, businessNumber) ||
                other.businessNumber == businessNumber) &&
            (identical(other.taxEmail, taxEmail) ||
                other.taxEmail == taxEmail) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.officePhone, officePhone) ||
                other.officePhone == officePhone) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      businessNumber,
      taxEmail,
      licenseNumber,
      officePhone,
      address2,
      lat,
      lon,
      createdAt,
      updatedAt,
      postcode,
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDataImplCopyWith<_$ClinicDataImpl> get copyWith =>
      __$$ClinicDataImplCopyWithImpl<_$ClinicDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDataImplToJson(
      this,
    );
  }
}

abstract class _ClinicData implements ClinicData {
  const factory _ClinicData(
      {required final int id,
      required final String? name,
      required final String? businessNumber,
      required final String? taxEmail,
      required final String? licenseNumber,
      required final String? officePhone,
      required final String? address2,
      required final String? lat,
      required final String? lon,
      required final String? createdAt,
      required final String? updatedAt,
      required final String? postcode,
      required final String? address}) = _$ClinicDataImpl;

  factory _ClinicData.fromJson(Map<String, dynamic> json) =
      _$ClinicDataImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get businessNumber;
  @override
  String? get taxEmail;
  @override
  String? get licenseNumber;
  @override
  String? get officePhone;
  @override
  String? get address2;
  @override
  String? get lat;
  @override
  String? get lon;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get postcode;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$ClinicDataImplCopyWith<_$ClinicDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
