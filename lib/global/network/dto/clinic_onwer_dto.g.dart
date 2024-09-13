// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_onwer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicInfoDataImpl _$$ClinicInfoDataImplFromJson(Map<String, dynamic> json) =>
    _$ClinicInfoDataImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      provider: json['provider'] as String?,
      confirmed: json['confirmed'] as bool,
      blocked: json['blocked'] as bool,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deleted: json['deleted'] as String?,
      clinicOwner: json['clinic_onwer'] == null
          ? null
          : ClinicOnwerData.fromJson(
              json['clinic_onwer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClinicInfoDataImplToJson(
        _$ClinicInfoDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
      'clinic_onwer': instance.clinicOwner,
    };

_$ClinicOnwerDataImpl _$$ClinicOnwerDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ClinicOnwerDataImpl(
      id: (json['id'] as num).toInt(),
      memo: json['memo'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      clinicData: json['clinic'] == null
          ? null
          : ClinicData.fromJson(json['clinic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClinicOnwerDataImplToJson(
        _$ClinicOnwerDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memo': instance.memo,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'clinic': instance.clinicData,
    };

_$ClinicDataImpl _$$ClinicDataImplFromJson(Map<String, dynamic> json) =>
    _$ClinicDataImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      businessNumber: json['businessNumber'] as String?,
      taxEmail: json['taxEmail'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      officePhone: json['officePhone'] as String?,
      address2: json['address2'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      postcode: json['postcode'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$ClinicDataImplToJson(_$ClinicDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'businessNumber': instance.businessNumber,
      'taxEmail': instance.taxEmail,
      'licenseNumber': instance.licenseNumber,
      'officePhone': instance.officePhone,
      'address2': instance.address2,
      'lat': instance.lat,
      'lon': instance.lon,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'postcode': instance.postcode,
      'address': instance.address,
    };
