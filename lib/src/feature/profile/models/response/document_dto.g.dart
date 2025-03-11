// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentDTOImpl _$$DocumentDTOImplFromJson(Map<String, dynamic> json) =>
    _$DocumentDTOImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      nameRu: json['name_ru'] as String?,
      file: json['file'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$DocumentDTOImplToJson(_$DocumentDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ru': instance.nameRu,
      'file': instance.file,
      'type': instance.type,
    };
