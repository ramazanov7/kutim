// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BonusDTOImpl _$$BonusDTOImplFromJson(Map<String, dynamic> json) =>
    _$BonusDTOImpl(
      bonus: (json['bonus'] as num?)?.toInt(),
      bonusHistory: (json['bonus_history'] as List<dynamic>?)
          ?.map((e) => BonusHistoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BonusDTOImplToJson(_$BonusDTOImpl instance) =>
    <String, dynamic>{
      'bonus': instance.bonus,
      'bonus_history': instance.bonusHistory,
    };

_$BonusHistoryDTOImpl _$$BonusHistoryDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BonusHistoryDTOImpl(
      orderId: (json['order_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      bonus: (json['bonus'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$BonusHistoryDTOImplToJson(
        _$BonusHistoryDTOImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'status': instance.status,
      'bonus': instance.bonus,
      'created_at': instance.createdAt,
    };
