// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PushDataDTO _$PushDataDTOFromJson(Map<String, dynamic> json) {
  return _PushDataDTO.fromJson(json);
}

/// @nodoc
mixin _$PushDataDTO {
  String? get body => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get feedbackId => throw _privateConstructorUsedError;

  /// Serializes this PushDataDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushDataDTOCopyWith<PushDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushDataDTOCopyWith<$Res> {
  factory $PushDataDTOCopyWith(
          PushDataDTO value, $Res Function(PushDataDTO) then) =
      _$PushDataDTOCopyWithImpl<$Res, PushDataDTO>;
  @useResult
  $Res call({String? body, String? type, String? title, String? feedbackId});
}

/// @nodoc
class _$PushDataDTOCopyWithImpl<$Res, $Val extends PushDataDTO>
    implements $PushDataDTOCopyWith<$Res> {
  _$PushDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? feedbackId = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushDataDTOImplCopyWith<$Res>
    implements $PushDataDTOCopyWith<$Res> {
  factory _$$PushDataDTOImplCopyWith(
          _$PushDataDTOImpl value, $Res Function(_$PushDataDTOImpl) then) =
      __$$PushDataDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? body, String? type, String? title, String? feedbackId});
}

/// @nodoc
class __$$PushDataDTOImplCopyWithImpl<$Res>
    extends _$PushDataDTOCopyWithImpl<$Res, _$PushDataDTOImpl>
    implements _$$PushDataDTOImplCopyWith<$Res> {
  __$$PushDataDTOImplCopyWithImpl(
      _$PushDataDTOImpl _value, $Res Function(_$PushDataDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? feedbackId = freezed,
  }) {
    return _then(_$PushDataDTOImpl(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushDataDTOImpl implements _PushDataDTO {
  const _$PushDataDTOImpl({this.body, this.type, this.title, this.feedbackId});

  factory _$PushDataDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushDataDTOImplFromJson(json);

  @override
  final String? body;
  @override
  final String? type;
  @override
  final String? title;
  @override
  final String? feedbackId;

  @override
  String toString() {
    return 'PushDataDTO(body: $body, type: $type, title: $title, feedbackId: $feedbackId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushDataDTOImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.feedbackId, feedbackId) ||
                other.feedbackId == feedbackId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, body, type, title, feedbackId);

  /// Create a copy of PushDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushDataDTOImplCopyWith<_$PushDataDTOImpl> get copyWith =>
      __$$PushDataDTOImplCopyWithImpl<_$PushDataDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushDataDTOImplToJson(
      this,
    );
  }
}

abstract class _PushDataDTO implements PushDataDTO {
  const factory _PushDataDTO(
      {final String? body,
      final String? type,
      final String? title,
      final String? feedbackId}) = _$PushDataDTOImpl;

  factory _PushDataDTO.fromJson(Map<String, dynamic> json) =
      _$PushDataDTOImpl.fromJson;

  @override
  String? get body;
  @override
  String? get type;
  @override
  String? get title;
  @override
  String? get feedbackId;

  /// Create a copy of PushDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushDataDTOImplCopyWith<_$PushDataDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushDataInfoDTO _$PushDataInfoDTOFromJson(Map<String, dynamic> json) {
  return _PushDataInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$PushDataInfoDTO {
  String? get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;

  /// Serializes this PushDataInfoDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushDataInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushDataInfoDTOCopyWith<PushDataInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushDataInfoDTOCopyWith<$Res> {
  factory $PushDataInfoDTOCopyWith(
          PushDataInfoDTO value, $Res Function(PushDataInfoDTO) then) =
      _$PushDataInfoDTOCopyWithImpl<$Res, PushDataInfoDTO>;
  @useResult
  $Res call({String? action, @JsonKey(name: 'order_id') String? orderId});
}

/// @nodoc
class _$PushDataInfoDTOCopyWithImpl<$Res, $Val extends PushDataInfoDTO>
    implements $PushDataInfoDTOCopyWith<$Res> {
  _$PushDataInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushDataInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushDataInfoDTOImplCopyWith<$Res>
    implements $PushDataInfoDTOCopyWith<$Res> {
  factory _$$PushDataInfoDTOImplCopyWith(_$PushDataInfoDTOImpl value,
          $Res Function(_$PushDataInfoDTOImpl) then) =
      __$$PushDataInfoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? action, @JsonKey(name: 'order_id') String? orderId});
}

/// @nodoc
class __$$PushDataInfoDTOImplCopyWithImpl<$Res>
    extends _$PushDataInfoDTOCopyWithImpl<$Res, _$PushDataInfoDTOImpl>
    implements _$$PushDataInfoDTOImplCopyWith<$Res> {
  __$$PushDataInfoDTOImplCopyWithImpl(
      _$PushDataInfoDTOImpl _value, $Res Function(_$PushDataInfoDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushDataInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_$PushDataInfoDTOImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushDataInfoDTOImpl implements _PushDataInfoDTO {
  const _$PushDataInfoDTOImpl(
      {this.action, @JsonKey(name: 'order_id') this.orderId});

  factory _$PushDataInfoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushDataInfoDTOImplFromJson(json);

  @override
  final String? action;
  @override
  @JsonKey(name: 'order_id')
  final String? orderId;

  @override
  String toString() {
    return 'PushDataInfoDTO(action: $action, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushDataInfoDTOImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, orderId);

  /// Create a copy of PushDataInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushDataInfoDTOImplCopyWith<_$PushDataInfoDTOImpl> get copyWith =>
      __$$PushDataInfoDTOImplCopyWithImpl<_$PushDataInfoDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushDataInfoDTOImplToJson(
      this,
    );
  }
}

abstract class _PushDataInfoDTO implements PushDataInfoDTO {
  const factory _PushDataInfoDTO(
          {final String? action,
          @JsonKey(name: 'order_id') final String? orderId}) =
      _$PushDataInfoDTOImpl;

  factory _PushDataInfoDTO.fromJson(Map<String, dynamic> json) =
      _$PushDataInfoDTOImpl.fromJson;

  @override
  String? get action;
  @override
  @JsonKey(name: 'order_id')
  String? get orderId;

  /// Create a copy of PushDataInfoDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushDataInfoDTOImplCopyWith<_$PushDataInfoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
