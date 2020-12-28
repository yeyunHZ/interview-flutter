//library baseresponse;

import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
class BaseResponse {
  int code;
  String message;
  dynamic data;
  BaseResponse({this.code,this.data, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BaseResponseToJson(this);
}

