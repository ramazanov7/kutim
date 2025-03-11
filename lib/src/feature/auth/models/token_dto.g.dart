// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenDTOImpl _$$TokenDTOImplFromJson(Map<String, dynamic> json) =>
    _$TokenDTOImpl(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$TokenDTOImplToJson(_$TokenDTOImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'role': instance.role,
    };
