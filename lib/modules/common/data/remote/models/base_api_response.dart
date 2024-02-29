import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse<T> {
  @JsonKey(name: 'data')
  final dynamic data;

  @JsonKey(name: 'error')
  dynamic error;

  BaseResponse({
    this.data,
    this.error,
  });

  factory BaseResponse.fromJson(dynamic json) {
    return BaseResponse(data: json);
  }
}
