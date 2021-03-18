// To parse this JSON data, do
//
//     final agentModelData = agentModelDataFromJson(jsonString);

import 'dart:convert';

AgentModelData agentModelDataFromJson(String str) => AgentModelData.fromJson(json.decode(str));

String agentModelDataToJson(AgentModelData data) => json.encode(data.toJson());

class AgentModelData {
  AgentModelData({
    this.code,
    this.data,
    this.status,
  });

  String code;
  List<AgentInfoDatum> data;
  int status;

  factory AgentModelData.fromJson(Map<String, dynamic> json) => AgentModelData(
    code: json["code"],
    data: List<AgentInfoDatum>.from(json["data"].map((x) => AgentInfoDatum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class AgentInfoDatum {
  AgentInfoDatum({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.tag,
    this.address,
    this.geolocation,
    this.role,
    this.dpLink,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String tag;
  String address;
  List<dynamic> geolocation;
  String role;
  dynamic dpLink;

  factory AgentInfoDatum.fromJson(Map<String, dynamic> json) => AgentInfoDatum(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    tag: json["tag"],
    address: json["address"],
    geolocation: List<dynamic>.from(json["geolocation"].map((x) => x)),
    role: json["role"],
    dpLink: json["dpLink"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "tag": tag,
    "address": address,
    "geolocation": List<dynamic>.from(geolocation.map((x) => x)),
    "role": role,
    "dpLink": dpLink,
  };
}
