// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPayload _$UserPayloadFromJson(Map<String, dynamic> json) {
  return _UserPayload.fromJson(json);
}

/// @nodoc
mixin _$UserPayload {
  @JsonKey(name: 'surname', includeIfNull: false)
  String? get surname => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type', includeIfNull: false)
  String? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_token', includeIfNull: false)
  String? get deviceToken => throw _privateConstructorUsedError;

  /// Serializes this UserPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPayloadCopyWith<UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPayloadCopyWith<$Res> {
  factory $UserPayloadCopyWith(
          UserPayload value, $Res Function(UserPayload) then) =
      _$UserPayloadCopyWithImpl<$Res, UserPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'surname', includeIfNull: false) String? surname,
      @JsonKey(name: 'name', includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(name: 'device_type', includeIfNull: false) String? deviceType,
      @JsonKey(name: 'device_token', includeIfNull: false)
      String? deviceToken});
}

/// @nodoc
class _$UserPayloadCopyWithImpl<$Res, $Val extends UserPayload>
    implements $UserPayloadCopyWith<$Res> {
  _$UserPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surname = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? deviceType = freezed,
    Object? deviceToken = freezed,
  }) {
    return _then(_value.copyWith(
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPayloadImplCopyWith<$Res>
    implements $UserPayloadCopyWith<$Res> {
  factory _$$UserPayloadImplCopyWith(
          _$UserPayloadImpl value, $Res Function(_$UserPayloadImpl) then) =
      __$$UserPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'surname', includeIfNull: false) String? surname,
      @JsonKey(name: 'name', includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(name: 'device_type', includeIfNull: false) String? deviceType,
      @JsonKey(name: 'device_token', includeIfNull: false)
      String? deviceToken});
}

/// @nodoc
class __$$UserPayloadImplCopyWithImpl<$Res>
    extends _$UserPayloadCopyWithImpl<$Res, _$UserPayloadImpl>
    implements _$$UserPayloadImplCopyWith<$Res> {
  __$$UserPayloadImplCopyWithImpl(
      _$UserPayloadImpl _value, $Res Function(_$UserPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surname = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? deviceType = freezed,
    Object? deviceToken = freezed,
  }) {
    return _then(_$UserPayloadImpl(
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPayloadImpl implements _UserPayload {
  const _$UserPayloadImpl(
      {@JsonKey(name: 'surname', includeIfNull: false) this.surname,
      @JsonKey(name: 'name', includeIfNull: false) this.name,
      @JsonKey(includeIfNull: false) this.email,
      @JsonKey(includeIfNull: false) this.phone,
      @JsonKey(includeIfNull: false) this.password,
      @JsonKey(name: 'device_type', includeIfNull: false) this.deviceType,
      @JsonKey(name: 'device_token', includeIfNull: false) this.deviceToken});

  factory _$UserPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'surname', includeIfNull: false)
  final String? surname;
  @override
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;
  @override
  @JsonKey(includeIfNull: false)
  final String? phone;
  @override
  @JsonKey(includeIfNull: false)
  final String? password;
  @override
  @JsonKey(name: 'device_type', includeIfNull: false)
  final String? deviceType;
  @override
  @JsonKey(name: 'device_token', includeIfNull: false)
  final String? deviceToken;

  @override
  String toString() {
    return 'UserPayload(surname: $surname, name: $name, email: $email, phone: $phone, password: $password, deviceType: $deviceType, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPayloadImpl &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, surname, name, email, phone,
      password, deviceType, deviceToken);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      __$$UserPayloadImplCopyWithImpl<_$UserPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPayloadImplToJson(
      this,
    );
  }
}

abstract class _UserPayload implements UserPayload {
  const factory _UserPayload(
      {@JsonKey(name: 'surname', includeIfNull: false) final String? surname,
      @JsonKey(name: 'name', includeIfNull: false) final String? name,
      @JsonKey(includeIfNull: false) final String? email,
      @JsonKey(includeIfNull: false) final String? phone,
      @JsonKey(includeIfNull: false) final String? password,
      @JsonKey(name: 'device_type', includeIfNull: false)
      final String? deviceType,
      @JsonKey(name: 'device_token', includeIfNull: false)
      final String? deviceToken}) = _$UserPayloadImpl;

  factory _UserPayload.fromJson(Map<String, dynamic> json) =
      _$UserPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'surname', includeIfNull: false)
  String? get surname;
  @override
  @JsonKey(name: 'name', includeIfNull: false)
  String? get name;
  @override
  @JsonKey(includeIfNull: false)
  String? get email;
  @override
  @JsonKey(includeIfNull: false)
  String? get phone;
  @override
  @JsonKey(includeIfNull: false)
  String? get password;
  @override
  @JsonKey(name: 'device_type', includeIfNull: false)
  String? get deviceType;
  @override
  @JsonKey(name: 'device_token', includeIfNull: false)
  String? get deviceToken;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
