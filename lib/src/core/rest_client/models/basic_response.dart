import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_response.g.dart';

/// All data models should extend from this class and imlement `fromJson`
/// in order to decode from `JSON`
abstract class BaseModel<T> {
  const BaseModel();

  T fromJson(Map<String, dynamic> json);
}

@JsonSerializable()
class BasicResponse extends BaseModel<BasicResponse> {
  const BasicResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory BasicResponse.fromJson(Map<String, dynamic> json) => _$BasicResponseFromJson(json);
  final int? statusCode;
  final String? message;
  final dynamic data;

  @override
  BasicResponse fromJson(Map<String, dynamic> json) => BasicResponse.fromJson(json);

  @override
  String toString() => 'BasicResponse(message: $message)';

  void when({required Null Function(dynamic user) success, required Null Function(dynamic e) failure}) {}
}
