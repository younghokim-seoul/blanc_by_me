// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_ai_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoAiRequestImpl _$$PhotoAiRequestImplFromJson(Map<String, dynamic> json) =>
    _$PhotoAiRequestImpl(
      data: AiRequestData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhotoAiRequestImplToJson(
        _$PhotoAiRequestImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AiRequestDataImpl _$$AiRequestDataImplFromJson(Map<String, dynamic> json) =>
    _$AiRequestDataImpl(
      clinicCustomer: (json['clinicCustomer'] as num).toInt(),
      device: json['device'] as String,
      toothImage: (json['toothImage'] as num).toInt(),
    );

Map<String, dynamic> _$$AiRequestDataImplToJson(_$AiRequestDataImpl instance) =>
    <String, dynamic>{
      'clinicCustomer': instance.clinicCustomer,
      'device': instance.device,
      'toothImage': instance.toothImage,
    };
