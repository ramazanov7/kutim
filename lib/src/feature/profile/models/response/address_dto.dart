// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
class AddressDTO with _$AddressDTO {
  const factory AddressDTO({
    @JsonKey(defaultValue: -1) int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'street') String? street,
    @JsonKey(name: 'house_number') String? houseNumber,
    @JsonKey(name: 'apartment_number') String? apartmentNumber,
    @JsonKey(name: 'entrance_number') String? entranceNumber,
    @JsonKey(name: 'floor') String? floor,
    @JsonKey(name: 'additional_comment') String? additionalComment,
    @JsonKey(name: 'active') int? active,
    @JsonKey(name: 'surname') String? surname,

    // for shop addresses
    String? address,
    String? phone,
    String? time,
    @JsonKey(name: 'partner_id') int? partnerId,
  }) = _AddressDTO;
  factory AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);
}
