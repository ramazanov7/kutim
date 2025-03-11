// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentDTO _$DocumentDTOFromJson(Map<String, dynamic> json) {
  return _DocumentDTO.fromJson(json);
}

/// @nodoc
mixin _$DocumentDTO {
  @JsonKey(defaultValue: -1)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ru')
  String? get nameRu => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this DocumentDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentDTOCopyWith<DocumentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDTOCopyWith<$Res> {
  factory $DocumentDTOCopyWith(
          DocumentDTO value, $Res Function(DocumentDTO) then) =
      _$DocumentDTOCopyWithImpl<$Res, DocumentDTO>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: -1) int? id,
      @JsonKey(name: 'name_ru') String? nameRu,
      String? file,
      String? type});
}

/// @nodoc
class _$DocumentDTOCopyWithImpl<$Res, $Val extends DocumentDTO>
    implements $DocumentDTOCopyWith<$Res> {
  _$DocumentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameRu = freezed,
    Object? file = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRu: freezed == nameRu
          ? _value.nameRu
          : nameRu // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentDTOImplCopyWith<$Res>
    implements $DocumentDTOCopyWith<$Res> {
  factory _$$DocumentDTOImplCopyWith(
          _$DocumentDTOImpl value, $Res Function(_$DocumentDTOImpl) then) =
      __$$DocumentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: -1) int? id,
      @JsonKey(name: 'name_ru') String? nameRu,
      String? file,
      String? type});
}

/// @nodoc
class __$$DocumentDTOImplCopyWithImpl<$Res>
    extends _$DocumentDTOCopyWithImpl<$Res, _$DocumentDTOImpl>
    implements _$$DocumentDTOImplCopyWith<$Res> {
  __$$DocumentDTOImplCopyWithImpl(
      _$DocumentDTOImpl _value, $Res Function(_$DocumentDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameRu = freezed,
    Object? file = freezed,
    Object? type = freezed,
  }) {
    return _then(_$DocumentDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRu: freezed == nameRu
          ? _value.nameRu
          : nameRu // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentDTOImpl implements _DocumentDTO {
  const _$DocumentDTOImpl(
      {@JsonKey(defaultValue: -1) this.id,
      @JsonKey(name: 'name_ru') this.nameRu,
      this.file,
      this.type});

  factory _$DocumentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentDTOImplFromJson(json);

  @override
  @JsonKey(defaultValue: -1)
  final int? id;
  @override
  @JsonKey(name: 'name_ru')
  final String? nameRu;
  @override
  final String? file;
  @override
  final String? type;

  @override
  String toString() {
    return 'DocumentDTO(id: $id, nameRu: $nameRu, file: $file, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameRu, nameRu) || other.nameRu == nameRu) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameRu, file, type);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      __$$DocumentDTOImplCopyWithImpl<_$DocumentDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentDTOImplToJson(
      this,
    );
  }
}

abstract class _DocumentDTO implements DocumentDTO {
  const factory _DocumentDTO(
      {@JsonKey(defaultValue: -1) final int? id,
      @JsonKey(name: 'name_ru') final String? nameRu,
      final String? file,
      final String? type}) = _$DocumentDTOImpl;

  factory _DocumentDTO.fromJson(Map<String, dynamic> json) =
      _$DocumentDTOImpl.fromJson;

  @override
  @JsonKey(defaultValue: -1)
  int? get id;
  @override
  @JsonKey(name: 'name_ru')
  String? get nameRu;
  @override
  String? get file;
  @override
  String? get type;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
