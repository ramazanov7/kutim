import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/auth/models/common_dto.dart';

part 'common_lists_dto.freezed.dart';
part 'common_lists_dto.g.dart';

@freezed
class CommonListsDTO with _$CommonListsDTO {
  const factory CommonListsDTO({
    List<CommonDTO>? cities,
    List<CommonDTO>? classes,
  }) = _CommonListsDTO;

  factory CommonListsDTO.fromJson(Map<String, dynamic> json) => _$CommonListsDTOFromJson(json);
}
