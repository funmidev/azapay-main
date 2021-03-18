// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BaseResponse baseResponseFromJson(String str) => BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    @required this.mode,
    @required this.exception,
    @required this.message,
    @required this.status,
  });

  final String mode;
  final String exception;
  final String message;
  final int status;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    mode: json["mode"],
    exception: json["exception"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "exception": exception,
    "message": message,
    "status": status,
  };
}
