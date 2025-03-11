// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_dto.freezed.dart';
part 'bonus_dto.g.dart';

@freezed
class BonusDTO with _$BonusDTO {
  const factory BonusDTO({
    int? bonus,
    @JsonKey(name: 'bonus_history') List<BonusHistoryDTO>? bonusHistory,
  }) = _BonusDTO;
  factory BonusDTO.fromJson(Map<String, dynamic> json) => _$BonusDTOFromJson(json);
}

@freezed
class BonusHistoryDTO with _$BonusHistoryDTO {
  const factory BonusHistoryDTO({
    @JsonKey(name: 'order_id') int? orderId,
    String? status,
    int? bonus,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _BonusHistoryDTO;
  factory BonusHistoryDTO.fromJson(Map<String, dynamic> json) => _$BonusHistoryDTOFromJson(json);
}
