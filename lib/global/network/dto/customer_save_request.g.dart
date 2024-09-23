// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_save_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerSaveRequestImpl _$$CustomerSaveRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSaveRequestImpl(
      data: CustomerSaveData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerSaveRequestImplToJson(
        _$CustomerSaveRequestImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CustomerSaveDataImpl _$$CustomerSaveDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSaveDataImpl(
      name: json['name'] as String,
      birthDay: json['birthDay'] as String,
      clinic: json['clinic'] as String,
    );

Map<String, dynamic> _$$CustomerSaveDataImplToJson(
        _$CustomerSaveDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDay': instance.birthDay,
      'clinic': instance.clinic,
    };
