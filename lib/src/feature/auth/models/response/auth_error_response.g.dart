// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthErrorResponseImpl _$$AuthErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthErrorResponseImpl(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$AuthErrorResponseImplToJson(
        _$AuthErrorResponseImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
