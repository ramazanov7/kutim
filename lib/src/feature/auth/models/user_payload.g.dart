// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPayloadImpl _$$UserPayloadImplFromJson(Map<String, dynamic> json) =>
    _$UserPayloadImpl(
      surname: json['surname'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'] as String?,
    );

Map<String, dynamic> _$$UserPayloadImplToJson(_$UserPayloadImpl instance) =>
    <String, dynamic>{
      if (instance.surname case final value?) 'surname': value,
      if (instance.name case final value?) 'name': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.password case final value?) 'password': value,
      if (instance.deviceType case final value?) 'device_type': value,
      if (instance.deviceToken case final value?) 'device_token': value,
    };
