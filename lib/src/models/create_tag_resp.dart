// To parse this JSON data, do
//
//     final createTagResp = createTagRespFromJson(jsonString);

import 'dart:convert';

CreateTagResp createTagRespFromJson(String str) => CreateTagResp.fromJson(json.decode(str));

String createTagRespToJson(CreateTagResp data) => json.encode(data.toJson());

class CreateTagResp {
  CreateTagResp({
    this.code,
    this.message,
    this.status,
  });

  String code;
  String message;
  int status;

  factory CreateTagResp.fromJson(Map<String, dynamic> json) => CreateTagResp(
    code: json["code"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "status": status,
  };
}
