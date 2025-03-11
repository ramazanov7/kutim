// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@freezed
class TokenDTO with _$TokenDTO {
  const factory TokenDTO({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'token_type') String? tokenType,
    String? role,
  }) = _TokenDTO;

  factory TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);
}
