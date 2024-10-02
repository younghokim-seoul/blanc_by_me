// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicUserImpl _$$ClinicUserImplFromJson(Map<String, dynamic> json) =>
    _$ClinicUserImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      clinicName: json['clinicName'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      address2: json['address2'] as String,
      privacyPolicy: json['privacyPolicy'] as bool,
      licenseNumber: json['licenseNumber'] as String,
      businessNumber: json['businessNumber'] as String,
    );

Map<String, dynamic> _$$ClinicUserImplToJson(_$ClinicUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'clinicName': instance.clinicName,
      'phone': instance.phone,
      'address': instance.address,
      'address2': instance.address2,
      'privacyPolicy': instance.privacyPolicy,
      'licenseNumber': instance.licenseNumber,
      'businessNumber': instance.businessNumber,
    };
