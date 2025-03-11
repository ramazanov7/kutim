// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_lists_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonListsDTO _$CommonListsDTOFromJson(Map<String, dynamic> json) {
  return _CommonListsDTO.fromJson(json);
}

/// @nodoc
mixin _$CommonListsDTO {
  List<CommonDTO>? get cities => throw _privateConstructorUsedError;
  List<CommonDTO>? get classes => throw _privateConstructorUsedError;

  /// Serializes this CommonListsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonListsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonListsDTOCopyWith<CommonListsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonListsDTOCopyWith<$Res> {
  factory $CommonListsDTOCopyWith(
          CommonListsDTO value, $Res Function(CommonListsDTO) then) =
      _$CommonListsDTOCopyWithImpl<$Res, CommonListsDTO>;
  @useResult
  $Res call({List<CommonDTO>? cities, List<CommonDTO>? classes});
}

/// @nodoc
class _$CommonListsDTOCopyWithImpl<$Res, $Val extends CommonListsDTO>
    implements $CommonListsDTOCopyWith<$Res> {
  _$CommonListsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonListsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
    Object? classes = freezed,
  }) {
    return _then(_value.copyWith(
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CommonDTO>?,
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<CommonDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonListsDTOImplCopyWith<$Res>
    implements $CommonListsDTOCopyWith<$Res> {
  factory _$$CommonListsDTOImplCopyWith(_$CommonListsDTOImpl value,
          $Res Function(_$CommonListsDTOImpl) then) =
      __$$CommonListsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommonDTO>? cities, List<CommonDTO>? classes});
}

/// @nodoc
class __$$CommonListsDTOImplCopyWithImpl<$Res>
    extends _$CommonListsDTOCopyWithImpl<$Res, _$CommonListsDTOImpl>
    implements _$$CommonListsDTOImplCopyWith<$Res> {
  __$$CommonListsDTOImplCopyWithImpl(
      _$CommonListsDTOImpl _value, $Res Function(_$CommonListsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonListsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
    Object? classes = freezed,
  }) {
    return _then(_$CommonListsDTOImpl(
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CommonDTO>?,
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<CommonDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonListsDTOImpl implements _CommonListsDTO {
  const _$CommonListsDTOImpl(
      {final List<CommonDTO>? cities, final List<CommonDTO>? classes})
      : _cities = cities,
        _classes = classes;

  factory _$CommonListsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonListsDTOImplFromJson(json);

  final List<CommonDTO>? _cities;
  @override
  List<CommonDTO>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CommonDTO>? _classes;
  @override
  List<CommonDTO>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommonListsDTO(cities: $cities, classes: $classes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonListsDTOImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._classes, _classes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_classes));

  /// Create a copy of CommonListsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonListsDTOImplCopyWith<_$CommonListsDTOImpl> get copyWith =>
      __$$CommonListsDTOImplCopyWithImpl<_$CommonListsDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonListsDTOImplToJson(
      this,
    );
  }
}

abstract class _CommonListsDTO implements CommonListsDTO {
  const factory _CommonListsDTO(
      {final List<CommonDTO>? cities,
      final List<CommonDTO>? classes}) = _$CommonListsDTOImpl;

  factory _CommonListsDTO.fromJson(Map<String, dynamic> json) =
      _$CommonListsDTOImpl.fromJson;

  @override
  List<CommonDTO>? get cities;
  @override
  List<CommonDTO>? get classes;

  /// Create a copy of CommonListsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonListsDTOImplCopyWith<_$CommonListsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
