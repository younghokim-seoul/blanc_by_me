// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicUserInfoImpl _$$ClinicUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClinicUserInfoImpl(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String,
      email: json['email'] as String,
      provider: json['provider'] as String,
      confirmed: json['confirmed'] as String,
      blocked: json['blocked'] as String,
    );

Map<String, dynamic> _$$ClinicUserInfoImplToJson(
        _$ClinicUserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
    };
