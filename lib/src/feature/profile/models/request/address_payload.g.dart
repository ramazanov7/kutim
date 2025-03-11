// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressPayloadImpl _$$AddressPayloadImplFromJson(Map<String, dynamic> json) =>
    _$AddressPayloadImpl(
      street: json['street'] as String?,
      houseNumber: json['house_number'] as String?,
      apartmentNumber: json['apartment_number'] as String?,
      entranceNumber: json['entrance_number'] as String?,
      floor: json['floor'] as String?,
      additionalComment: json['additional_comment'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressPayloadImplToJson(
        _$AddressPayloadImpl instance) =>
    <String, dynamic>{
      if (instance.street case final value?) 'street': value,
      if (instance.houseNumber case final value?) 'house_number': value,
      if (instance.apartmentNumber case final value?) 'apartment_number': value,
      if (instance.entranceNumber case final value?) 'entrance_number': value,
      if (instance.floor case final value?) 'floor': value,
      if (instance.additionalComment case final value?)
        'additional_comment': value,
      if (instance.cityId case final value?) 'city_id': value,
    };
