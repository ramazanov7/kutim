// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    @JsonKey(defaultValue: -1) int? id,
    @JsonKey(name: 'full_name') String? fullName,
    String? email,
    String? phone,
    String? avatar,
    int? rating,
    @JsonKey(name: 'city_name') String? cityName,
    @JsonKey(name: 'skin_type') String? skinType,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'device_token') String? deviceToken,
    @JsonKey(name: 'device_type') String? deviceType,
    TokenDTO? token,
  }) = _UserDTO;
  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);
}

@freezed
class TokenDTO with _$TokenDTO {
  const factory TokenDTO({
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'access_token') String? accessToken,
  }) = _TokenDTO;
  factory TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);
}
