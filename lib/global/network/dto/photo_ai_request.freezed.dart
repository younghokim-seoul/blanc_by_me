// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_ai_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoAiRequest _$PhotoAiRequestFromJson(Map<String, dynamic> json) {
  return _PhotoAiRequest.fromJson(json);
}

/// @nodoc
mixin _$PhotoAiRequest {
  AiRequestData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoAiRequestCopyWith<PhotoAiRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoAiRequestCopyWith<$Res> {
  factory $PhotoAiRequestCopyWith(
          PhotoAiRequest value, $Res Function(PhotoAiRequest) then) =
      _$PhotoAiRequestCopyWithImpl<$Res, PhotoAiRequest>;
  @useResult
  $Res call({AiRequestData data});

  $AiRequestDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PhotoAiRequestCopyWithImpl<$Res, $Val extends PhotoAiRequest>
    implements $PhotoAiRequestCopyWith<$Res> {
  _$PhotoAiRequestCopyWithImpl(this._value, this._then);

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
              as AiRequestData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AiRequestDataCopyWith<$Res> get data {
    return $AiRequestDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoAiRequestImplCopyWith<$Res>
    implements $PhotoAiRequestCopyWith<$Res> {
  factory _$$PhotoAiRequestImplCopyWith(_$PhotoAiRequestImpl value,
          $Res Function(_$PhotoAiRequestImpl) then) =
      __$$PhotoAiRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AiRequestData data});

  @override
  $AiRequestDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PhotoAiRequestImplCopyWithImpl<$Res>
    extends _$PhotoAiRequestCopyWithImpl<$Res, _$PhotoAiRequestImpl>
    implements _$$PhotoAiRequestImplCopyWith<$Res> {
  __$$PhotoAiRequestImplCopyWithImpl(
      _$PhotoAiRequestImpl _value, $Res Function(_$PhotoAiRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PhotoAiRequestImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AiRequestData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoAiRequestImpl implements _PhotoAiRequest {
  const _$PhotoAiRequestImpl({required this.data});

  factory _$PhotoAiRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoAiRequestImplFromJson(json);

  @override
  final AiRequestData data;

  @override
  String toString() {
    return 'PhotoAiRequest(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoAiRequestImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoAiRequestImplCopyWith<_$PhotoAiRequestImpl> get copyWith =>
      __$$PhotoAiRequestImplCopyWithImpl<_$PhotoAiRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoAiRequestImplToJson(
      this,
    );
  }
}

abstract class _PhotoAiRequest implements PhotoAiRequest {
  const factory _PhotoAiRequest({required final AiRequestData data}) =
      _$PhotoAiRequestImpl;

  factory _PhotoAiRequest.fromJson(Map<String, dynamic> json) =
      _$PhotoAiRequestImpl.fromJson;

  @override
  AiRequestData get data;
  @override
  @JsonKey(ignore: true)
  _$$PhotoAiRequestImplCopyWith<_$PhotoAiRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiRequestData _$AiRequestDataFromJson(Map<String, dynamic> json) {
  return _AiRequestData.fromJson(json);
}

/// @nodoc
mixin _$AiRequestData {
  int get clinicCustomer => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;
  int get toothImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiRequestDataCopyWith<AiRequestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiRequestDataCopyWith<$Res> {
  factory $AiRequestDataCopyWith(
          AiRequestData value, $Res Function(AiRequestData) then) =
      _$AiRequestDataCopyWithImpl<$Res, AiRequestData>;
  @useResult
  $Res call({int clinicCustomer, String device, int toothImage});
}

/// @nodoc
class _$AiRequestDataCopyWithImpl<$Res, $Val extends AiRequestData>
    implements $AiRequestDataCopyWith<$Res> {
  _$AiRequestDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicCustomer = null,
    Object? device = null,
    Object? toothImage = null,
  }) {
    return _then(_value.copyWith(
      clinicCustomer: null == clinicCustomer
          ? _value.clinicCustomer
          : clinicCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      toothImage: null == toothImage
          ? _value.toothImage
          : toothImage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiRequestDataImplCopyWith<$Res>
    implements $AiRequestDataCopyWith<$Res> {
  factory _$$AiRequestDataImplCopyWith(
          _$AiRequestDataImpl value, $Res Function(_$AiRequestDataImpl) then) =
      __$$AiRequestDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int clinicCustomer, String device, int toothImage});
}

/// @nodoc
class __$$AiRequestDataImplCopyWithImpl<$Res>
    extends _$AiRequestDataCopyWithImpl<$Res, _$AiRequestDataImpl>
    implements _$$AiRequestDataImplCopyWith<$Res> {
  __$$AiRequestDataImplCopyWithImpl(
      _$AiRequestDataImpl _value, $Res Function(_$AiRequestDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicCustomer = null,
    Object? device = null,
    Object? toothImage = null,
  }) {
    return _then(_$AiRequestDataImpl(
      clinicCustomer: null == clinicCustomer
          ? _value.clinicCustomer
          : clinicCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      toothImage: null == toothImage
          ? _value.toothImage
          : toothImage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiRequestDataImpl implements _AiRequestData {
  const _$AiRequestDataImpl(
      {required this.clinicCustomer,
      required this.device,
      required this.toothImage});

  factory _$AiRequestDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiRequestDataImplFromJson(json);

  @override
  final int clinicCustomer;
  @override
  final String device;
  @override
  final int toothImage;

  @override
  String toString() {
    return 'AiRequestData(clinicCustomer: $clinicCustomer, device: $device, toothImage: $toothImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiRequestDataImpl &&
            (identical(other.clinicCustomer, clinicCustomer) ||
                other.clinicCustomer == clinicCustomer) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.toothImage, toothImage) ||
                other.toothImage == toothImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clinicCustomer, device, toothImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiRequestDataImplCopyWith<_$AiRequestDataImpl> get copyWith =>
      __$$AiRequestDataImplCopyWithImpl<_$AiRequestDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiRequestDataImplToJson(
      this,
    );
  }
}

abstract class _AiRequestData implements AiRequestData {
  const factory _AiRequestData(
      {required final int clinicCustomer,
      required final String device,
      required final int toothImage}) = _$AiRequestDataImpl;

  factory _AiRequestData.fromJson(Map<String, dynamic> json) =
      _$AiRequestDataImpl.fromJson;

  @override
  int get clinicCustomer;
  @override
  String get device;
  @override
  int get toothImage;
  @override
  @JsonKey(ignore: true)
  _$$AiRequestDataImplCopyWith<_$AiRequestDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
