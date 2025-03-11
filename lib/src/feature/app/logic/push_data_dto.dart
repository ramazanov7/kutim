// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_data_dto.freezed.dart';
part 'push_data_dto.g.dart';

@freezed
class PushDataDTO with _$PushDataDTO {
  const factory PushDataDTO({
    String? body,
    String? type,
    String? title,
    String? feedbackId,
  }) = _PushDataDTO;

  factory PushDataDTO.fromJson(Map<String, dynamic> json) => _$PushDataDTOFromJson(json);
}

@freezed
class PushDataInfoDTO with _$PushDataInfoDTO {
  const factory PushDataInfoDTO({
    String? action,
    @JsonKey(name: 'order_id') String? orderId,
  }) = _PushDataInfoDTO;

  factory PushDataInfoDTO.fromJson(Map<String, dynamic> json) => _$PushDataInfoDTOFromJson(json);
}
