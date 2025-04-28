// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    int? id,
    String? name,
    String? volume,
    String? description,
    @JsonKey(name: 'skin_type') String? skinType,
    String? usage,
    String? image,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}
