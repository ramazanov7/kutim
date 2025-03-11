// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonDTO _$CommonDTOFromJson(Map<String, dynamic> json) {
  return _CommonDTO.fromJson(json);
}

/// @nodoc
mixin _$CommonDTO {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this CommonDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonDTOCopyWith<CommonDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonDTOCopyWith<$Res> {
  factory $CommonDTOCopyWith(CommonDTO value, $Res Function(CommonDTO) then) =
      _$CommonDTOCopyWithImpl<$Res, CommonDTO>;
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class _$CommonDTOCopyWithImpl<$Res, $Val extends CommonDTO>
    implements $CommonDTOCopyWith<$Res> {
  _$CommonDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonDTOImplCopyWith<$Res>
    implements $CommonDTOCopyWith<$Res> {
  factory _$$CommonDTOImplCopyWith(
          _$CommonDTOImpl value, $Res Function(_$CommonDTOImpl) then) =
      __$$CommonDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class __$$CommonDTOImplCopyWithImpl<$Res>
    extends _$CommonDTOCopyWithImpl<$Res, _$CommonDTOImpl>
    implements _$$CommonDTOImplCopyWith<$Res> {
  __$$CommonDTOImplCopyWithImpl(
      _$CommonDTOImpl _value, $Res Function(_$CommonDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$CommonDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonDTOImpl implements _CommonDTO {
  const _$CommonDTOImpl({required this.id, this.name});

  factory _$CommonDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'CommonDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of CommonDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonDTOImplCopyWith<_$CommonDTOImpl> get copyWith =>
      __$$CommonDTOImplCopyWithImpl<_$CommonDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonDTOImplToJson(
      this,
    );
  }
}

abstract class _CommonDTO implements CommonDTO {
  const factory _CommonDTO({required final int id, final String? name}) =
      _$CommonDTOImpl;

  factory _CommonDTO.fromJson(Map<String, dynamic> json) =
      _$CommonDTOImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;

  /// Create a copy of CommonDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonDTOImplCopyWith<_$CommonDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
