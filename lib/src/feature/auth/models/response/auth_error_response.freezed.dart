// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthErrorResponse _$AuthErrorResponseFromJson(Map<String, dynamic> json) {
  return _AuthErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthErrorResponse {
  String? get phone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation => throw _privateConstructorUsedError;

  /// Serializes this AuthErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthErrorResponseCopyWith<AuthErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthErrorResponseCopyWith<$Res> {
  factory $AuthErrorResponseCopyWith(
          AuthErrorResponse value, $Res Function(AuthErrorResponse) then) =
      _$AuthErrorResponseCopyWithImpl<$Res, AuthErrorResponse>;
  @useResult
  $Res call(
      {String? phone,
      String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class _$AuthErrorResponseCopyWithImpl<$Res, $Val extends AuthErrorResponse>
    implements $AuthErrorResponseCopyWith<$Res> {
  _$AuthErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthErrorResponseImplCopyWith<$Res>
    implements $AuthErrorResponseCopyWith<$Res> {
  factory _$$AuthErrorResponseImplCopyWith(_$AuthErrorResponseImpl value,
          $Res Function(_$AuthErrorResponseImpl) then) =
      __$$AuthErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? phone,
      String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class __$$AuthErrorResponseImplCopyWithImpl<$Res>
    extends _$AuthErrorResponseCopyWithImpl<$Res, _$AuthErrorResponseImpl>
    implements _$$AuthErrorResponseImplCopyWith<$Res> {
  __$$AuthErrorResponseImplCopyWithImpl(_$AuthErrorResponseImpl _value,
      $Res Function(_$AuthErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_$AuthErrorResponseImpl(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthErrorResponseImpl implements _AuthErrorResponse {
  const _$AuthErrorResponseImpl(
      {this.phone,
      this.password,
      @JsonKey(name: 'password_confirmation') this.passwordConfirmation});

  factory _$AuthErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthErrorResponseImplFromJson(json);

  @override
  final String? phone;
  @override
  final String? password;
  @override
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  @override
  String toString() {
    return 'AuthErrorResponse(phone: $phone, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorResponseImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phone, password, passwordConfirmation);

  /// Create a copy of AuthErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorResponseImplCopyWith<_$AuthErrorResponseImpl> get copyWith =>
      __$$AuthErrorResponseImplCopyWithImpl<_$AuthErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthErrorResponse implements AuthErrorResponse {
  const factory _AuthErrorResponse(
      {final String? phone,
      final String? password,
      @JsonKey(name: 'password_confirmation')
      final String? passwordConfirmation}) = _$AuthErrorResponseImpl;

  factory _AuthErrorResponse.fromJson(Map<String, dynamic> json) =
      _$AuthErrorResponseImpl.fromJson;

  @override
  String? get phone;
  @override
  String? get password;
  @override
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation;

  /// Create a copy of AuthErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorResponseImplCopyWith<_$AuthErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
