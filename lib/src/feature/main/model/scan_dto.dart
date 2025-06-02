// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_dto.freezed.dart';
part 'scan_dto.g.dart';

@freezed
class ScanDTO with _$ScanDTO {
  const factory ScanDTO({
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'skin_type') String? skinType,
    @JsonKey(name: 'scan_results') List<StepsDTO>? scanResults,
  }) = _ScanDTO;

  factory ScanDTO.fromJson(Map<String, dynamic> json) => _$ScanDTOFromJson(json);
}

@freezed
class StepsDTO with _$StepsDTO {
  const factory StepsDTO({
    int? id,
    String? name,
    String? description,
    String? image,
  }) = _StepsDTO;

  factory StepsDTO.fromJson(Map<String, dynamic> json) => _$StepsDTOFromJson(json);
}
