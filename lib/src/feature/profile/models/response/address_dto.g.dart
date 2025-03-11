// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDTOImpl _$$AddressDTOImplFromJson(Map<String, dynamic> json) =>
    _$AddressDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      userId: (json['user_id'] as num?)?.toInt(),
      street: json['street'] as String?,
      houseNumber: json['house_number'] as String?,
      apartmentNumber: json['apartment_number'] as String?,
      entranceNumber: json['entrance_number'] as String?,
      floor: json['floor'] as String?,
      additionalComment: json['additional_comment'] as String?,
      active: (json['active'] as num?)?.toInt(),
      surname: json['surname'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      time: json['time'] as String?,
      partnerId: (json['partner_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressDTOImplToJson(_$AddressDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'street': instance.street,
      'house_number': instance.houseNumber,
      'apartment_number': instance.apartmentNumber,
      'entrance_number': instance.entranceNumber,
      'floor': instance.floor,
      'additional_comment': instance.additionalComment,
      'active': instance.active,
      'surname': instance.surname,
      'address': instance.address,
      'phone': instance.phone,
      'time': instance.time,
      'partner_id': instance.partnerId,
    };
