// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerRootData _$CustomerRootDataFromJson(Map<String, dynamic> json) {
  return _CustomerRootData.fromJson(json);
}

/// @nodoc
mixin _$CustomerRootData {
  List<CustomerData> get data => throw _privateConstructorUsedError;
  MetaData get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerRootDataCopyWith<CustomerRootData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerRootDataCopyWith<$Res> {
  factory $CustomerRootDataCopyWith(
          CustomerRootData value, $Res Function(CustomerRootData) then) =
      _$CustomerRootDataCopyWithImpl<$Res, CustomerRootData>;
  @useResult
  $Res call({List<CustomerData> data, MetaData meta});

  $MetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class _$CustomerRootDataCopyWithImpl<$Res, $Val extends CustomerRootData>
    implements $CustomerRootDataCopyWith<$Res> {
  _$CustomerRootDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerData>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDataCopyWith<$Res> get meta {
    return $MetaDataCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerRootDataImplCopyWith<$Res>
    implements $CustomerRootDataCopyWith<$Res> {
  factory _$$CustomerRootDataImplCopyWith(_$CustomerRootDataImpl value,
          $Res Function(_$CustomerRootDataImpl) then) =
      __$$CustomerRootDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerData> data, MetaData meta});

  @override
  $MetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CustomerRootDataImplCopyWithImpl<$Res>
    extends _$CustomerRootDataCopyWithImpl<$Res, _$CustomerRootDataImpl>
    implements _$$CustomerRootDataImplCopyWith<$Res> {
  __$$CustomerRootDataImplCopyWithImpl(_$CustomerRootDataImpl _value,
      $Res Function(_$CustomerRootDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$CustomerRootDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerData>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerRootDataImpl implements _CustomerRootData {
  const _$CustomerRootDataImpl(
      {required final List<CustomerData> data, required this.meta})
      : _data = data;

  factory _$CustomerRootDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerRootDataImplFromJson(json);

  final List<CustomerData> _data;
  @override
  List<CustomerData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final MetaData meta;

  @override
  String toString() {
    return 'CustomerRootData(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerRootDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerRootDataImplCopyWith<_$CustomerRootDataImpl> get copyWith =>
      __$$CustomerRootDataImplCopyWithImpl<_$CustomerRootDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerRootDataImplToJson(
      this,
    );
  }
}

abstract class _CustomerRootData implements CustomerRootData {
  const factory _CustomerRootData(
      {required final List<CustomerData> data,
      required final MetaData meta}) = _$CustomerRootDataImpl;

  factory _CustomerRootData.fromJson(Map<String, dynamic> json) =
      _$CustomerRootDataImpl.fromJson;

  @override
  List<CustomerData> get data;
  @override
  MetaData get meta;
  @override
  @JsonKey(ignore: true)
  _$$CustomerRootDataImplCopyWith<_$CustomerRootDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return _CustomerData.fromJson(json);
}

/// @nodoc
mixin _$CustomerData {
  int get id => throw _privateConstructorUsedError;
  AttributesData get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDataCopyWith<CustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDataCopyWith<$Res> {
  factory $CustomerDataCopyWith(
          CustomerData value, $Res Function(CustomerData) then) =
      _$CustomerDataCopyWithImpl<$Res, CustomerData>;
  @useResult
  $Res call({int id, AttributesData attributes});

  $AttributesDataCopyWith<$Res> get attributes;
}

/// @nodoc
class _$CustomerDataCopyWithImpl<$Res, $Val extends CustomerData>
    implements $CustomerDataCopyWith<$Res> {
  _$CustomerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as AttributesData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesDataCopyWith<$Res> get attributes {
    return $AttributesDataCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerDataImplCopyWith<$Res>
    implements $CustomerDataCopyWith<$Res> {
  factory _$$CustomerDataImplCopyWith(
          _$CustomerDataImpl value, $Res Function(_$CustomerDataImpl) then) =
      __$$CustomerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, AttributesData attributes});

  @override
  $AttributesDataCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$CustomerDataImplCopyWithImpl<$Res>
    extends _$CustomerDataCopyWithImpl<$Res, _$CustomerDataImpl>
    implements _$$CustomerDataImplCopyWith<$Res> {
  __$$CustomerDataImplCopyWithImpl(
      _$CustomerDataImpl _value, $Res Function(_$CustomerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_$CustomerDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as AttributesData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDataImpl implements _CustomerData {
  const _$CustomerDataImpl({required this.id, required this.attributes});

  factory _$CustomerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDataImplFromJson(json);

  @override
  final int id;
  @override
  final AttributesData attributes;

  @override
  String toString() {
    return 'CustomerData(id: $id, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      __$$CustomerDataImplCopyWithImpl<_$CustomerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDataImplToJson(
      this,
    );
  }
}

abstract class _CustomerData implements CustomerData {
  const factory _CustomerData(
      {required final int id,
      required final AttributesData attributes}) = _$CustomerDataImpl;

  factory _CustomerData.fromJson(Map<String, dynamic> json) =
      _$CustomerDataImpl.fromJson;

  @override
  int get id;
  @override
  AttributesData get attributes;
  @override
  @JsonKey(ignore: true)
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttributesData _$AttributesDataFromJson(Map<String, dynamic> json) {
  return _AttributesData.fromJson(json);
}

/// @nodoc
mixin _$AttributesData {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributesDataCopyWith<AttributesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesDataCopyWith<$Res> {
  factory $AttributesDataCopyWith(
          AttributesData value, $Res Function(AttributesData) then) =
      _$AttributesDataCopyWithImpl<$Res, AttributesData>;
  @useResult
  $Res call(
      {String identifier,
      String name,
      String birthDay,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$AttributesDataCopyWithImpl<$Res, $Val extends AttributesData>
    implements $AttributesDataCopyWith<$Res> {
  _$AttributesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? birthDay = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributesDataImplCopyWith<$Res>
    implements $AttributesDataCopyWith<$Res> {
  factory _$$AttributesDataImplCopyWith(_$AttributesDataImpl value,
          $Res Function(_$AttributesDataImpl) then) =
      __$$AttributesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String name,
      String birthDay,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$AttributesDataImplCopyWithImpl<$Res>
    extends _$AttributesDataCopyWithImpl<$Res, _$AttributesDataImpl>
    implements _$$AttributesDataImplCopyWith<$Res> {
  __$$AttributesDataImplCopyWithImpl(
      _$AttributesDataImpl _value, $Res Function(_$AttributesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? birthDay = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AttributesDataImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributesDataImpl implements _AttributesData {
  const _$AttributesDataImpl(
      {required this.identifier,
      required this.name,
      required this.birthDay,
      required this.createdAt,
      required this.updatedAt});

  factory _$AttributesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributesDataImplFromJson(json);

  @override
  final String identifier;
  @override
  final String name;
  @override
  final String birthDay;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'AttributesData(identifier: $identifier, name: $name, birthDay: $birthDay, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributesDataImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, name, birthDay, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributesDataImplCopyWith<_$AttributesDataImpl> get copyWith =>
      __$$AttributesDataImplCopyWithImpl<_$AttributesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributesDataImplToJson(
      this,
    );
  }
}

abstract class _AttributesData implements AttributesData {
  const factory _AttributesData(
      {required final String identifier,
      required final String name,
      required final String birthDay,
      required final String? createdAt,
      required final String? updatedAt}) = _$AttributesDataImpl;

  factory _AttributesData.fromJson(Map<String, dynamic> json) =
      _$AttributesDataImpl.fromJson;

  @override
  String get identifier;
  @override
  String get name;
  @override
  String get birthDay;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AttributesDataImplCopyWith<_$AttributesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return _MetaData.fromJson(json);
}

/// @nodoc
mixin _$MetaData {
  PaginationData get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataCopyWith<MetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataCopyWith<$Res> {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) then) =
      _$MetaDataCopyWithImpl<$Res, MetaData>;
  @useResult
  $Res call({PaginationData pagination});

  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MetaDataCopyWithImpl<$Res, $Val extends MetaData>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationDataCopyWith<$Res> get pagination {
    return $PaginationDataCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaDataImplCopyWith<$Res>
    implements $MetaDataCopyWith<$Res> {
  factory _$$MetaDataImplCopyWith(
          _$MetaDataImpl value, $Res Function(_$MetaDataImpl) then) =
      __$$MetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationData pagination});

  @override
  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$MetaDataImplCopyWithImpl<$Res>
    extends _$MetaDataCopyWithImpl<$Res, _$MetaDataImpl>
    implements _$$MetaDataImplCopyWith<$Res> {
  __$$MetaDataImplCopyWithImpl(
      _$MetaDataImpl _value, $Res Function(_$MetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_$MetaDataImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataImpl implements _MetaData {
  const _$MetaDataImpl({required this.pagination});

  factory _$MetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataImplFromJson(json);

  @override
  final PaginationData pagination;

  @override
  String toString() {
    return 'MetaData(pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      __$$MetaDataImplCopyWithImpl<_$MetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataImplToJson(
      this,
    );
  }
}

abstract class _MetaData implements MetaData {
  const factory _MetaData({required final PaginationData pagination}) =
      _$MetaDataImpl;

  factory _MetaData.fromJson(Map<String, dynamic> json) =
      _$MetaDataImpl.fromJson;

  @override
  PaginationData get pagination;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) {
  return _PaginationData.fromJson(json);
}

/// @nodoc
mixin _$PaginationData {
  int get start => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationDataCopyWith<PaginationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDataCopyWith<$Res> {
  factory $PaginationDataCopyWith(
          PaginationData value, $Res Function(PaginationData) then) =
      _$PaginationDataCopyWithImpl<$Res, PaginationData>;
  @useResult
  $Res call({int start, int limit, int total});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<$Res, $Val extends PaginationData>
    implements $PaginationDataCopyWith<$Res> {
  _$PaginationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationDataImplCopyWith<$Res>
    implements $PaginationDataCopyWith<$Res> {
  factory _$$PaginationDataImplCopyWith(_$PaginationDataImpl value,
          $Res Function(_$PaginationDataImpl) then) =
      __$$PaginationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int limit, int total});
}

/// @nodoc
class __$$PaginationDataImplCopyWithImpl<$Res>
    extends _$PaginationDataCopyWithImpl<$Res, _$PaginationDataImpl>
    implements _$$PaginationDataImplCopyWith<$Res> {
  __$$PaginationDataImplCopyWithImpl(
      _$PaginationDataImpl _value, $Res Function(_$PaginationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$PaginationDataImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationDataImpl implements _PaginationData {
  const _$PaginationDataImpl(
      {required this.start, required this.limit, required this.total});

  factory _$PaginationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationDataImplFromJson(json);

  @override
  final int start;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString() {
    return 'PaginationData(start: $start, limit: $limit, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDataImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, limit, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      __$$PaginationDataImplCopyWithImpl<_$PaginationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationDataImplToJson(
      this,
    );
  }
}

abstract class _PaginationData implements PaginationData {
  const factory _PaginationData(
      {required final int start,
      required final int limit,
      required final int total}) = _$PaginationDataImpl;

  factory _PaginationData.fromJson(Map<String, dynamic> json) =
      _$PaginationDataImpl.fromJson;

  @override
  int get start;
  @override
  int get limit;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
