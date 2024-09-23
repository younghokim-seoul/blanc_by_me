// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_save_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerSaveRequest _$CustomerSaveRequestFromJson(Map<String, dynamic> json) {
  return _CustomerSaveRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerSaveRequest {
  CustomerSaveData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerSaveRequestCopyWith<CustomerSaveRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSaveRequestCopyWith<$Res> {
  factory $CustomerSaveRequestCopyWith(
          CustomerSaveRequest value, $Res Function(CustomerSaveRequest) then) =
      _$CustomerSaveRequestCopyWithImpl<$Res, CustomerSaveRequest>;
  @useResult
  $Res call({CustomerSaveData data});

  $CustomerSaveDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CustomerSaveRequestCopyWithImpl<$Res, $Val extends CustomerSaveRequest>
    implements $CustomerSaveRequestCopyWith<$Res> {
  _$CustomerSaveRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CustomerSaveData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerSaveDataCopyWith<$Res> get data {
    return $CustomerSaveDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerSaveRequestImplCopyWith<$Res>
    implements $CustomerSaveRequestCopyWith<$Res> {
  factory _$$CustomerSaveRequestImplCopyWith(_$CustomerSaveRequestImpl value,
          $Res Function(_$CustomerSaveRequestImpl) then) =
      __$$CustomerSaveRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomerSaveData data});

  @override
  $CustomerSaveDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CustomerSaveRequestImplCopyWithImpl<$Res>
    extends _$CustomerSaveRequestCopyWithImpl<$Res, _$CustomerSaveRequestImpl>
    implements _$$CustomerSaveRequestImplCopyWith<$Res> {
  __$$CustomerSaveRequestImplCopyWithImpl(_$CustomerSaveRequestImpl _value,
      $Res Function(_$CustomerSaveRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CustomerSaveRequestImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CustomerSaveData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSaveRequestImpl implements _CustomerSaveRequest {
  const _$CustomerSaveRequestImpl({required this.data});

  factory _$CustomerSaveRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSaveRequestImplFromJson(json);

  @override
  final CustomerSaveData data;

  @override
  String toString() {
    return 'CustomerSaveRequest(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSaveRequestImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSaveRequestImplCopyWith<_$CustomerSaveRequestImpl> get copyWith =>
      __$$CustomerSaveRequestImplCopyWithImpl<_$CustomerSaveRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSaveRequestImplToJson(
      this,
    );
  }
}

abstract class _CustomerSaveRequest implements CustomerSaveRequest {
  const factory _CustomerSaveRequest({required final CustomerSaveData data}) =
      _$CustomerSaveRequestImpl;

  factory _CustomerSaveRequest.fromJson(Map<String, dynamic> json) =
      _$CustomerSaveRequestImpl.fromJson;

  @override
  CustomerSaveData get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSaveRequestImplCopyWith<_$CustomerSaveRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerSaveData _$CustomerSaveDataFromJson(Map<String, dynamic> json) {
  return _CustomerSaveData.fromJson(json);
}

/// @nodoc
mixin _$CustomerSaveData {
  String get name => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  String get clinic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerSaveDataCopyWith<CustomerSaveData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSaveDataCopyWith<$Res> {
  factory $CustomerSaveDataCopyWith(
          CustomerSaveData value, $Res Function(CustomerSaveData) then) =
      _$CustomerSaveDataCopyWithImpl<$Res, CustomerSaveData>;
  @useResult
  $Res call({String name, String birthDay, String clinic});
}

/// @nodoc
class _$CustomerSaveDataCopyWithImpl<$Res, $Val extends CustomerSaveData>
    implements $CustomerSaveDataCopyWith<$Res> {
  _$CustomerSaveDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = null,
    Object? clinic = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      clinic: null == clinic
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerSaveDataImplCopyWith<$Res>
    implements $CustomerSaveDataCopyWith<$Res> {
  factory _$$CustomerSaveDataImplCopyWith(_$CustomerSaveDataImpl value,
          $Res Function(_$CustomerSaveDataImpl) then) =
      __$$CustomerSaveDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String birthDay, String clinic});
}

/// @nodoc
class __$$CustomerSaveDataImplCopyWithImpl<$Res>
    extends _$CustomerSaveDataCopyWithImpl<$Res, _$CustomerSaveDataImpl>
    implements _$$CustomerSaveDataImplCopyWith<$Res> {
  __$$CustomerSaveDataImplCopyWithImpl(_$CustomerSaveDataImpl _value,
      $Res Function(_$CustomerSaveDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = null,
    Object? clinic = null,
  }) {
    return _then(_$CustomerSaveDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      clinic: null == clinic
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSaveDataImpl implements _CustomerSaveData {
  const _$CustomerSaveDataImpl(
      {required this.name, required this.birthDay, required this.clinic});

  factory _$CustomerSaveDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSaveDataImplFromJson(json);

  @override
  final String name;
  @override
  final String birthDay;
  @override
  final String clinic;

  @override
  String toString() {
    return 'CustomerSaveData(name: $name, birthDay: $birthDay, clinic: $clinic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSaveDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.clinic, clinic) || other.clinic == clinic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthDay, clinic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSaveDataImplCopyWith<_$CustomerSaveDataImpl> get copyWith =>
      __$$CustomerSaveDataImplCopyWithImpl<_$CustomerSaveDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSaveDataImplToJson(
      this,
    );
  }
}

abstract class _CustomerSaveData implements CustomerSaveData {
  const factory _CustomerSaveData(
      {required final String name,
      required final String birthDay,
      required final String clinic}) = _$CustomerSaveDataImpl;

  factory _CustomerSaveData.fromJson(Map<String, dynamic> json) =
      _$CustomerSaveDataImpl.fromJson;

  @override
  String get name;
  @override
  String get birthDay;
  @override
  String get clinic;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSaveDataImplCopyWith<_$CustomerSaveDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
