// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_lists_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonListsDTOImpl _$$CommonListsDTOImplFromJson(Map<String, dynamic> json) =>
    _$CommonListsDTOImpl(
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CommonDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => CommonDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommonListsDTOImplToJson(
        _$CommonListsDTOImpl instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'classes': instance.classes,
    };
