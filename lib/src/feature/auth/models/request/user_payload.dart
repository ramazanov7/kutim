// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payload.freezed.dart';
part 'user_payload.g.dart';

@freezed
class UserPayload with _$UserPayload {
  const factory UserPayload({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'language_id') int? languageId,
  }) = _UserPayload;

  factory UserPayload.fromJson(Map<String, dynamic> json) => _$UserPayloadFromJson(json);
}
