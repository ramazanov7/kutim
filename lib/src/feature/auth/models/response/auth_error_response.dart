import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_error_response.freezed.dart';
part 'auth_error_response.g.dart';

@freezed
class AuthErrorResponse with _$AuthErrorResponse {
  const factory AuthErrorResponse({
    String? phone,
    String? password,
    @JsonKey(name: 'password_confirmation') String? passwordConfirmation,
  }) = _AuthErrorResponse;

  factory AuthErrorResponse.fromJson(Map<String, dynamic> json) => _$AuthErrorResponseFromJson(json);
}
