// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payload.freezed.dart';
part 'user_payload.g.dart';

@freezed
class UserPayload with _$UserPayload {
  const factory UserPayload({
    @JsonKey(name: 'surname', includeIfNull: false) String? surname,
    @JsonKey(name: 'name', includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) String? email,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false) String? password,
    @JsonKey(name: 'device_type', includeIfNull: false) String? deviceType,
    @JsonKey(name: 'device_token', includeIfNull: false) String? deviceToken,
  }) = _UserPayload;

  factory UserPayload.fromJson(Map<String, dynamic> json) => _$UserPayloadFromJson(json);
}
