// ignore_for_file: invalid_annotation_target

import 'package:kutim/src/feature/main/model/main_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    @JsonKey(defaultValue: -1) int? id,
    @JsonKey(name: 'name') String? name,
    String? email,
    String? phone,
    String? avatar,
    int? rating,
    @JsonKey(name: 'city_name') String? cityName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'device_token') String? deviceToken,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = _UserDTO;
  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);
}
