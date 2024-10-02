// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerPhotoDtoImpl _$$CustomerPhotoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPhotoDtoImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PhotoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerPhotoDtoImplToJson(
        _$CustomerPhotoDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PhotoDataImpl _$$PhotoDataImplFromJson(Map<String, dynamic> json) =>
    _$PhotoDataImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      size: (json['size'] as num).toDouble(),
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$$PhotoDataImplToJson(_$PhotoDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'provider': instance.provider,
    };
