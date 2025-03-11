// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushDataDTOImpl _$$PushDataDTOImplFromJson(Map<String, dynamic> json) =>
    _$PushDataDTOImpl(
      body: json['body'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      feedbackId: json['feedbackId'] as String?,
    );

Map<String, dynamic> _$$PushDataDTOImplToJson(_$PushDataDTOImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'type': instance.type,
      'title': instance.title,
      'feedbackId': instance.feedbackId,
    };

_$PushDataInfoDTOImpl _$$PushDataInfoDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PushDataInfoDTOImpl(
      action: json['action'] as String?,
      orderId: json['order_id'] as String?,
    );

Map<String, dynamic> _$$PushDataInfoDTOImplToJson(
        _$PushDataInfoDTOImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'order_id': instance.orderId,
    };
