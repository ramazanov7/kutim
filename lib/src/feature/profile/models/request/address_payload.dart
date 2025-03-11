// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_payload.freezed.dart';
part 'address_payload.g.dart';

@freezed
class AddressPayload with _$AddressPayload {
  const factory AddressPayload({
    @JsonKey(name: 'street', includeIfNull: false) String? street,
    @JsonKey(name: 'house_number', includeIfNull: false) String? houseNumber,
    @JsonKey(name: 'apartment_number', includeIfNull: false) String? apartmentNumber,
    @JsonKey(name: 'entrance_number', includeIfNull: false) String? entranceNumber,
    @JsonKey(includeIfNull: false) String? floor,
    @JsonKey(name: 'additional_comment', includeIfNull: false) String? additionalComment,
    @JsonKey(name: 'city_id', includeIfNull: false) int? cityId,
  }) = _AddressPayload;

  factory AddressPayload.fromJson(Map<String, dynamic> json) => _$AddressPayloadFromJson(json);
}
