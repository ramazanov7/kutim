// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'main_dto.freezed.dart';
// part 'main_dto.g.dart';

// @freezed
// class MainDTO with _$MainDTO {
//   const factory MainDTO({
//     List<CityDTO>? city,
//     List<CountryDTO>? country,
//     List<CatalogDTO>? catalog,
//     List<SubCatalogDTO>? subCatalog,
//     List<LanguageDTO>? language,
//   }) = _MainDTO;

//   factory MainDTO.fromJson(Map<String, dynamic> json) => _$MainDTOFromJson(json);
// }

// @freezed
// class CityDTO with _$CityDTO {
//   const factory CityDTO({
//     required int id,
//     required String name,
//     @JsonKey(name: 'name_kk') String? nameKk,
//     @JsonKey(name: 'name_en') String? nameEn,
//     @JsonKey(name: 'name_uz') String? nameUz,
//     CountryDTO? country,
//   }) = _CityDTO;

//   factory CityDTO.fromJson(Map<String, dynamic> json) => _$CityDTOFromJson(json);
// }

// @freezed
// class LanguageDTO with _$LanguageDTO {
//   const factory LanguageDTO({
//     required int id,
//     required String name,
//     @JsonKey(name: 'name_kk') String? nameKk,
//     @JsonKey(name: 'name_en') String? nameEn,
//     @JsonKey(name: 'name_uz') String? nameUz,
//     CountryDTO? country,
//   }) = _LanguageDTO;

//   factory LanguageDTO.fromJson(Map<String, dynamic> json) => _$LanguageDTOFromJson(json);
// }

// @freezed
// class CountryDTO with _$CountryDTO {
//   const factory CountryDTO({
//     required int id,
//     required String name,
//     @JsonKey(name: 'name_kk') String? nameKk,
//     @JsonKey(name: 'name_en') String? nameEn,
//     @JsonKey(name: 'name_uz') String? nameUz,
//   }) = _CountryDTO;

//   factory CountryDTO.fromJson(Map<String, dynamic> json) => _$CountryDTOFromJson(json);
// }

// @freezed
// class CatalogDTO with _$CatalogDTO {
//   const factory CatalogDTO({
//     required int id,
//     required String name,
//     @JsonKey(name: 'created_at') String? createdAt,
//     @JsonKey(name: 'name_kk') String? nameKk,
//     @JsonKey(name: 'name_en') String? nameEn,
//     @JsonKey(name: 'name_uz') String? nameUz,
//     String? image,
//   }) = _CatalogDTO;

//   factory CatalogDTO.fromJson(Map<String, dynamic> json) => _$CatalogDTOFromJson(json);
// }

// @freezed
// class SubCatalogDTO with _$SubCatalogDTO {
//   const factory SubCatalogDTO({
//     required int id,
//     required String name,
//     @JsonKey(name: 'name_kk') String? nameKk,
//     @JsonKey(name: 'name_en') String? nameEn,
//     @JsonKey(name: 'name_uz') String? nameUz,
//     CatalogDTO? catalog,
//     @JsonKey(name: 'created_at') String? createdAt,
//   }) = _SubCatalogDTO;

//   factory SubCatalogDTO.fromJson(Map<String, dynamic> json) => _$SubCatalogDTOFromJson(json);
// }
