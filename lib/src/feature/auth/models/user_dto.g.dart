// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      cityName: json['city_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      accessToken: json['access_token'] as String?,
      deviceToken: json['device_token'] as String?,
      deviceType: json['device_type'] as String?,
      token: json['token'] == null
          ? null
          : TokenDTO.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'rating': instance.rating,
      'city_name': instance.cityName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'access_token': instance.accessToken,
      'device_token': instance.deviceToken,
      'device_type': instance.deviceType,
      'token': instance.token,
    };

_$TokenDTOImpl _$$TokenDTOImplFromJson(Map<String, dynamic> json) =>
    _$TokenDTOImpl(
      tokenType: json['token_type'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$$TokenDTOImplToJson(_$TokenDTOImpl instance) =>
    <String, dynamic>{
      'token_type': instance.tokenType,
      'access_token': instance.accessToken,
    };
