// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) {
  return _AddressDTO.fromJson(json);
}

/// @nodoc
mixin _$AddressDTO {
  @JsonKey(defaultValue: -1)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'street')
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_number')
  String? get houseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'entrance_number')
  String? get entranceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor')
  String? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_comment')
  String? get additionalComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  int? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'surname')
  String? get surname =>
      throw _privateConstructorUsedError; // for shop addresses
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_id')
  int? get partnerId => throw _privateConstructorUsedError;

  /// Serializes this AddressDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressDTOCopyWith<AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDTOCopyWith<$Res> {
  factory $AddressDTOCopyWith(
          AddressDTO value, $Res Function(AddressDTO) then) =
      _$AddressDTOCopyWithImpl<$Res, AddressDTO>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: -1) int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'street') String? street,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'entrance_number') String? entranceNumber,
      @JsonKey(name: 'floor') String? floor,
      @JsonKey(name: 'additional_comment') String? additionalComment,
      @JsonKey(name: 'active') int? active,
      @JsonKey(name: 'surname') String? surname,
      String? address,
      String? phone,
      String? time,
      @JsonKey(name: 'partner_id') int? partnerId});
}

/// @nodoc
class _$AddressDTOCopyWithImpl<$Res, $Val extends AddressDTO>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? active = freezed,
    Object? surname = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? time = freezed,
    Object? partnerId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDTOImplCopyWith<$Res>
    implements $AddressDTOCopyWith<$Res> {
  factory _$$AddressDTOImplCopyWith(
          _$AddressDTOImpl value, $Res Function(_$AddressDTOImpl) then) =
      __$$AddressDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: -1) int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'street') String? street,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'entrance_number') String? entranceNumber,
      @JsonKey(name: 'floor') String? floor,
      @JsonKey(name: 'additional_comment') String? additionalComment,
      @JsonKey(name: 'active') int? active,
      @JsonKey(name: 'surname') String? surname,
      String? address,
      String? phone,
      String? time,
      @JsonKey(name: 'partner_id') int? partnerId});
}

/// @nodoc
class __$$AddressDTOImplCopyWithImpl<$Res>
    extends _$AddressDTOCopyWithImpl<$Res, _$AddressDTOImpl>
    implements _$$AddressDTOImplCopyWith<$Res> {
  __$$AddressDTOImplCopyWithImpl(
      _$AddressDTOImpl _value, $Res Function(_$AddressDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? street = freezed,
    Object? houseNumber = freezed,
    Object? apartmentNumber = freezed,
    Object? entranceNumber = freezed,
    Object? floor = freezed,
    Object? additionalComment = freezed,
    Object? active = freezed,
    Object? surname = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? time = freezed,
    Object? partnerId = freezed,
  }) {
    return _then(_$AddressDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDTOImpl implements _AddressDTO {
  const _$AddressDTOImpl(
      {@JsonKey(defaultValue: -1) this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'street') this.street,
      @JsonKey(name: 'house_number') this.houseNumber,
      @JsonKey(name: 'apartment_number') this.apartmentNumber,
      @JsonKey(name: 'entrance_number') this.entranceNumber,
      @JsonKey(name: 'floor') this.floor,
      @JsonKey(name: 'additional_comment') this.additionalComment,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'surname') this.surname,
      this.address,
      this.phone,
      this.time,
      @JsonKey(name: 'partner_id') this.partnerId});

  factory _$AddressDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDTOImplFromJson(json);

  @override
  @JsonKey(defaultValue: -1)
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'street')
  final String? street;
  @override
  @JsonKey(name: 'house_number')
  final String? houseNumber;
  @override
  @JsonKey(name: 'apartment_number')
  final String? apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number')
  final String? entranceNumber;
  @override
  @JsonKey(name: 'floor')
  final String? floor;
  @override
  @JsonKey(name: 'additional_comment')
  final String? additionalComment;
  @override
  @JsonKey(name: 'active')
  final int? active;
  @override
  @JsonKey(name: 'surname')
  final String? surname;
// for shop addresses
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? time;
  @override
  @JsonKey(name: 'partner_id')
  final int? partnerId;

  @override
  String toString() {
    return 'AddressDTO(id: $id, userId: $userId, street: $street, houseNumber: $houseNumber, apartmentNumber: $apartmentNumber, entranceNumber: $entranceNumber, floor: $floor, additionalComment: $additionalComment, active: $active, surname: $surname, address: $address, phone: $phone, time: $time, partnerId: $partnerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
            (identical(other.active, active) || other.active == active) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      street,
      houseNumber,
      apartmentNumber,
      entranceNumber,
      floor,
      additionalComment,
      active,
      surname,
      address,
      phone,
      time,
      partnerId);

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDTOImplCopyWith<_$AddressDTOImpl> get copyWith =>
      __$$AddressDTOImplCopyWithImpl<_$AddressDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDTOImplToJson(
      this,
    );
  }
}

abstract class _AddressDTO implements AddressDTO {
  const factory _AddressDTO(
      {@JsonKey(defaultValue: -1) final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'street') final String? street,
      @JsonKey(name: 'house_number') final String? houseNumber,
      @JsonKey(name: 'apartment_number') final String? apartmentNumber,
      @JsonKey(name: 'entrance_number') final String? entranceNumber,
      @JsonKey(name: 'floor') final String? floor,
      @JsonKey(name: 'additional_comment') final String? additionalComment,
      @JsonKey(name: 'active') final int? active,
      @JsonKey(name: 'surname') final String? surname,
      final String? address,
      final String? phone,
      final String? time,
      @JsonKey(name: 'partner_id') final int? partnerId}) = _$AddressDTOImpl;

  factory _AddressDTO.fromJson(Map<String, dynamic> json) =
      _$AddressDTOImpl.fromJson;

  @override
  @JsonKey(defaultValue: -1)
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'street')
  String? get street;
  @override
  @JsonKey(name: 'house_number')
  String? get houseNumber;
  @override
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber;
  @override
  @JsonKey(name: 'entrance_number')
  String? get entranceNumber;
  @override
  @JsonKey(name: 'floor')
  String? get floor;
  @override
  @JsonKey(name: 'additional_comment')
  String? get additionalComment;
  @override
  @JsonKey(name: 'active')
  int? get active;
  @override
  @JsonKey(name: 'surname')
  String? get surname; // for shop addresses
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get time;
  @override
  @JsonKey(name: 'partner_id')
  int? get partnerId;

  /// Create a copy of AddressDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDTOImplCopyWith<_$AddressDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
