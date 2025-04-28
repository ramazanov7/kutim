// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';

part 'scan_dto.freezed.dart';
part 'scan_dto.g.dart';

@freezed
class ScanDTO with _$ScanDTO {
  const factory ScanDTO({
    List<String>? conditions,
    List<StepsDTO>? steps,
  }) = _ScanDTO;

  factory ScanDTO.fromJson(Map<String, dynamic> json) => _$ScanDTOFromJson(json);
}

@freezed
class StepsDTO with _$StepsDTO {
  const factory StepsDTO({
    int? step,
    String? title,
    ProductDTO? product,
  }) = _StepsDTO;

  factory StepsDTO.fromJson(Map<String, dynamic> json) => _$StepsDTOFromJson(json);
}
