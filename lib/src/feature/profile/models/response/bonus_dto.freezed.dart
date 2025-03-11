// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BonusDTO _$BonusDTOFromJson(Map<String, dynamic> json) {
  return _BonusDTO.fromJson(json);
}

/// @nodoc
mixin _$BonusDTO {
  int? get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_history')
  List<BonusHistoryDTO>? get bonusHistory => throw _privateConstructorUsedError;

  /// Serializes this BonusDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BonusDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BonusDTOCopyWith<BonusDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusDTOCopyWith<$Res> {
  factory $BonusDTOCopyWith(BonusDTO value, $Res Function(BonusDTO) then) =
      _$BonusDTOCopyWithImpl<$Res, BonusDTO>;
  @useResult
  $Res call(
      {int? bonus,
      @JsonKey(name: 'bonus_history') List<BonusHistoryDTO>? bonusHistory});
}

/// @nodoc
class _$BonusDTOCopyWithImpl<$Res, $Val extends BonusDTO>
    implements $BonusDTOCopyWith<$Res> {
  _$BonusDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BonusDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonus = freezed,
    Object? bonusHistory = freezed,
  }) {
    return _then(_value.copyWith(
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusHistory: freezed == bonusHistory
          ? _value.bonusHistory
          : bonusHistory // ignore: cast_nullable_to_non_nullable
              as List<BonusHistoryDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BonusDTOImplCopyWith<$Res>
    implements $BonusDTOCopyWith<$Res> {
  factory _$$BonusDTOImplCopyWith(
          _$BonusDTOImpl value, $Res Function(_$BonusDTOImpl) then) =
      __$$BonusDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? bonus,
      @JsonKey(name: 'bonus_history') List<BonusHistoryDTO>? bonusHistory});
}

/// @nodoc
class __$$BonusDTOImplCopyWithImpl<$Res>
    extends _$BonusDTOCopyWithImpl<$Res, _$BonusDTOImpl>
    implements _$$BonusDTOImplCopyWith<$Res> {
  __$$BonusDTOImplCopyWithImpl(
      _$BonusDTOImpl _value, $Res Function(_$BonusDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BonusDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonus = freezed,
    Object? bonusHistory = freezed,
  }) {
    return _then(_$BonusDTOImpl(
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusHistory: freezed == bonusHistory
          ? _value._bonusHistory
          : bonusHistory // ignore: cast_nullable_to_non_nullable
              as List<BonusHistoryDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BonusDTOImpl implements _BonusDTO {
  const _$BonusDTOImpl(
      {this.bonus,
      @JsonKey(name: 'bonus_history')
      final List<BonusHistoryDTO>? bonusHistory})
      : _bonusHistory = bonusHistory;

  factory _$BonusDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BonusDTOImplFromJson(json);

  @override
  final int? bonus;
  final List<BonusHistoryDTO>? _bonusHistory;
  @override
  @JsonKey(name: 'bonus_history')
  List<BonusHistoryDTO>? get bonusHistory {
    final value = _bonusHistory;
    if (value == null) return null;
    if (_bonusHistory is EqualUnmodifiableListView) return _bonusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BonusDTO(bonus: $bonus, bonusHistory: $bonusHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BonusDTOImpl &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            const DeepCollectionEquality()
                .equals(other._bonusHistory, _bonusHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, bonus, const DeepCollectionEquality().hash(_bonusHistory));

  /// Create a copy of BonusDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BonusDTOImplCopyWith<_$BonusDTOImpl> get copyWith =>
      __$$BonusDTOImplCopyWithImpl<_$BonusDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BonusDTOImplToJson(
      this,
    );
  }
}

abstract class _BonusDTO implements BonusDTO {
  const factory _BonusDTO(
      {final int? bonus,
      @JsonKey(name: 'bonus_history')
      final List<BonusHistoryDTO>? bonusHistory}) = _$BonusDTOImpl;

  factory _BonusDTO.fromJson(Map<String, dynamic> json) =
      _$BonusDTOImpl.fromJson;

  @override
  int? get bonus;
  @override
  @JsonKey(name: 'bonus_history')
  List<BonusHistoryDTO>? get bonusHistory;

  /// Create a copy of BonusDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BonusDTOImplCopyWith<_$BonusDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BonusHistoryDTO _$BonusHistoryDTOFromJson(Map<String, dynamic> json) {
  return _BonusHistoryDTO.fromJson(json);
}

/// @nodoc
mixin _$BonusHistoryDTO {
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BonusHistoryDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BonusHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BonusHistoryDTOCopyWith<BonusHistoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusHistoryDTOCopyWith<$Res> {
  factory $BonusHistoryDTOCopyWith(
          BonusHistoryDTO value, $Res Function(BonusHistoryDTO) then) =
      _$BonusHistoryDTOCopyWithImpl<$Res, BonusHistoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') int? orderId,
      String? status,
      int? bonus,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$BonusHistoryDTOCopyWithImpl<$Res, $Val extends BonusHistoryDTO>
    implements $BonusHistoryDTOCopyWith<$Res> {
  _$BonusHistoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BonusHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? status = freezed,
    Object? bonus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BonusHistoryDTOImplCopyWith<$Res>
    implements $BonusHistoryDTOCopyWith<$Res> {
  factory _$$BonusHistoryDTOImplCopyWith(_$BonusHistoryDTOImpl value,
          $Res Function(_$BonusHistoryDTOImpl) then) =
      __$$BonusHistoryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') int? orderId,
      String? status,
      int? bonus,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$BonusHistoryDTOImplCopyWithImpl<$Res>
    extends _$BonusHistoryDTOCopyWithImpl<$Res, _$BonusHistoryDTOImpl>
    implements _$$BonusHistoryDTOImplCopyWith<$Res> {
  __$$BonusHistoryDTOImplCopyWithImpl(
      _$BonusHistoryDTOImpl _value, $Res Function(_$BonusHistoryDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BonusHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? status = freezed,
    Object? bonus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$BonusHistoryDTOImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BonusHistoryDTOImpl implements _BonusHistoryDTO {
  const _$BonusHistoryDTOImpl(
      {@JsonKey(name: 'order_id') this.orderId,
      this.status,
      this.bonus,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$BonusHistoryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BonusHistoryDTOImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  final String? status;
  @override
  final int? bonus;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'BonusHistoryDTO(orderId: $orderId, status: $status, bonus: $bonus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BonusHistoryDTOImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, status, bonus, createdAt);

  /// Create a copy of BonusHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BonusHistoryDTOImplCopyWith<_$BonusHistoryDTOImpl> get copyWith =>
      __$$BonusHistoryDTOImplCopyWithImpl<_$BonusHistoryDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BonusHistoryDTOImplToJson(
      this,
    );
  }
}

abstract class _BonusHistoryDTO implements BonusHistoryDTO {
  const factory _BonusHistoryDTO(
          {@JsonKey(name: 'order_id') final int? orderId,
          final String? status,
          final int? bonus,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$BonusHistoryDTOImpl;

  factory _BonusHistoryDTO.fromJson(Map<String, dynamic> json) =
      _$BonusHistoryDTOImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  String? get status;
  @override
  int? get bonus;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of BonusHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BonusHistoryDTOImplCopyWith<_$BonusHistoryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
