// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressPayload _$AddressPayloadFromJson(Map<String, dynamic> json) {
  return _AddressPayload.fromJson(json);
}

/// @nodoc
mixin _$AddressPayload {
  @JsonKey(name: 'street', includeIfNull: false)
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_number', includeIfNull: false)
  String? get houseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'apartment_number', includeIfNull: false)
  String? get apartmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'entrance_number', includeIfNull: false)
  String? get entranceNumber => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_comment', includeIfNull: false)
  String? get additionalComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id', includeIfNull: false)
  int? get cityId => throw _privateConstructorUsedError;

  /// Serializes this AddressPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressPayloadCopyWith<AddressPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressPayloadCopyWith<$Res> {
  factory $AddressPayloadCopyWith(
          AddressPayload value, $Res Function(AddressPayload) then) =
      _$AddressPayloadCopyWithImpl<$Res, AddressPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'street', includeIfNull: false) String? street,
      @JsonKey(name: 'house_number', includeIfNull: false) String? houseNumber,
      @JsonKey(name: 'apartment_number', includeIfNull: false)
      String? apartmentNumber,
      @JsonKey(name: 'entrance_number', includeIfNull: false)
      String? entranceNumber,
      @JsonKey(includeIfNull: false) String? floor,
      @JsonKey(name: 'additional_comment', includeIfNull: false)
      String? additionalComment,
      @JsonKey(name: 'city_id', includeIfNull: false) int? cityId});
}

/// @nodoc
class _$AddressPayloadCopyWithImpl<$Res, $Val extends AddressPayload>
    implements $AddressPayloadCopyWith<$Res> {
  _$AddressPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? cityId = freezed,
  }) {
    return _then(_value.copyWith(
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceNumber: freezed == entranceNumber
          ? _value.entranceNumber
          : entranceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalComment: freezed == additionalComment
          ? _value.additionalComment
          : additionalComment // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressPayloadImplCopyWith<$Res>
    implements $AddressPayloadCopyWith<$Res> {
  factory _$$AddressPayloadImplCopyWith(_$AddressPayloadImpl value,
          $Res Function(_$AddressPayloadImpl) then) =
      __$$AddressPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'street', includeIfNull: false) String? street,
      @JsonKey(name: 'house_number', includeIfNull: false) String? houseNumber,
      @JsonKey(name: 'apartment_number', includeIfNull: false)
      String? apartmentNumber,
      @JsonKey(name: 'entrance_number', includeIfNull: false)
      String? entranceNumber,
      @JsonKey(includeIfNull: false) String? floor,
      @JsonKey(name: 'additional_comment', includeIfNull: false)
      String? additionalComment,
      @JsonKey(name: 'city_id', includeIfNull: false) int? cityId});
}

/// @nodoc
class __$$AddressPayloadImplCopyWithImpl<$Res>
    extends _$AddressPayloadCopyWithImpl<$Res, _$AddressPayloadImpl>
    implements _$$AddressPayloadImplCopyWith<$Res> {
  __$$AddressPayloadImplCopyWithImpl(
      _$AddressPayloadImpl _value, $Res Function(_$AddressPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? cityId = freezed,
  }) {
    return _then(_$AddressPayloadImpl(
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceNumber: freezed == entranceNumber
          ? _value.entranceNumber
          : entranceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalComment: freezed == additionalComment
          ? _value.additionalComment
          : additionalComment // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressPayloadImpl implements _AddressPayload {
  const _$AddressPayloadImpl(
      {@JsonKey(name: 'street', includeIfNull: false) this.street,
      @JsonKey(name: 'house_number', includeIfNull: false) this.houseNumber,
      @JsonKey(name: 'apartment_number', includeIfNull: false)
      this.apartmentNumber,
      @JsonKey(name: 'entrance_number', includeIfNull: false)
      this.entranceNumber,
      @JsonKey(includeIfNull: false) this.floor,
      @JsonKey(name: 'additional_comment', includeIfNull: false)
      this.additionalComment,
      @JsonKey(name: 'city_id', includeIfNull: false) this.cityId});

  factory _$AddressPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'street', includeIfNull: false)
  final String? street;
  @override
  @JsonKey(name: 'house_number', includeIfNull: false)
  final String? houseNumber;
  @override
  @JsonKey(name: 'apartment_number', includeIfNull: false)
  final String? apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number', includeIfNull: false)
  final String? entranceNumber;
  @override
  @JsonKey(includeIfNull: false)
  final String? floor;
  @override
  @JsonKey(name: 'additional_comment', includeIfNull: false)
  final String? additionalComment;
  @override
  @JsonKey(name: 'city_id', includeIfNull: false)
  final int? cityId;

  @override
  String toString() {
    return 'AddressPayload(street: $street, houseNumber: $houseNumber, apartmentNumber: $apartmentNumber, entranceNumber: $entranceNumber, floor: $floor, additionalComment: $additionalComment, cityId: $cityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressPayloadImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.apartmentNumber, apartmentNumber) ||
                other.apartmentNumber == apartmentNumber) &&
            (identical(other.entranceNumber, entranceNumber) ||
                other.entranceNumber == entranceNumber) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.additionalComment, additionalComment) ||
                other.additionalComment == additionalComment) &&
            (identical(other.cityId, cityId) || other.cityId == cityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, street, houseNumber,
      apartmentNumber, entranceNumber, floor, additionalComment, cityId);

  /// Create a copy of AddressPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressPayloadImplCopyWith<_$AddressPayloadImpl> get copyWith =>
      __$$AddressPayloadImplCopyWithImpl<_$AddressPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressPayloadImplToJson(
      this,
    );
  }
}

abstract class _AddressPayload implements AddressPayload {
  const factory _AddressPayload(
          {@JsonKey(name: 'street', includeIfNull: false) final String? street,
          @JsonKey(name: 'house_number', includeIfNull: false)
          final String? houseNumber,
          @JsonKey(name: 'apartment_number', includeIfNull: false)
          final String? apartmentNumber,
          @JsonKey(name: 'entrance_number', includeIfNull: false)
          final String? entranceNumber,
          @JsonKey(includeIfNull: false) final String? floor,
          @JsonKey(name: 'additional_comment', includeIfNull: false)
          final String? additionalComment,
          @JsonKey(name: 'city_id', includeIfNull: false) final int? cityId}) =
      _$AddressPayloadImpl;

  factory _AddressPayload.fromJson(Map<String, dynamic> json) =
      _$AddressPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'street', includeIfNull: false)
  String? get street;
  @override
  @JsonKey(name: 'house_number', includeIfNull: false)
  String? get houseNumber;
  @override
  @JsonKey(name: 'apartment_number', includeIfNull: false)
  String? get apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number', includeIfNull: false)
  String? get entranceNumber;
  @override
  @JsonKey(includeIfNull: false)
  String? get floor;
  @override
  @JsonKey(name: 'additional_comment', includeIfNull: false)
  String? get additionalComment;
  @override
  @JsonKey(name: 'city_id', includeIfNull: false)
  int? get cityId;

  /// Create a copy of AddressPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressPayloadImplCopyWith<_$AddressPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
