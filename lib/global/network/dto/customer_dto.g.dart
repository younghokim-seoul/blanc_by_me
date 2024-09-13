// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerRootDataImpl _$$CustomerRootDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerRootDataImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerRootDataImplToJson(
        _$CustomerRootDataImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$CustomerDataImpl _$$CustomerDataImplFromJson(Map<String, dynamic> json) =>
    _$CustomerDataImpl(
      id: (json['id'] as num).toInt(),
      attributes:
          AttributesData.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerDataImplToJson(_$CustomerDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$AttributesDataImpl _$$AttributesDataImplFromJson(Map<String, dynamic> json) =>
    _$AttributesDataImpl(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      birthDay: json['birthDay'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$AttributesDataImplToJson(
        _$AttributesDataImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'birthDay': instance.birthDay,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      pagination:
          PaginationData.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

_$PaginationDataImpl _$$PaginationDataImplFromJson(Map<String, dynamic> json) =>
    _$PaginationDataImpl(
      start: (json['start'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationDataImplToJson(
        _$PaginationDataImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'limit': instance.limit,
      'total': instance.total,
    };
