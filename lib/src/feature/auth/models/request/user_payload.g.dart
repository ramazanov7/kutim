// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPayloadImpl _$$UserPayloadImplFromJson(Map<String, dynamic> json) =>
    _$UserPayloadImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      languageId: (json['language_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserPayloadImplToJson(_$UserPayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'city_id': instance.cityId,
      'language_id': instance.languageId,
    };
