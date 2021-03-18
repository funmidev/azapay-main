// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));

String agentModelToJson(AgentModel data) => json.encode(data.toJson());

class AgentModel {
  AgentModel({
    @required this.code,
    @required this.data,
    @required this.status,
  });

  final String code;
  final AgentData data;
  final int status;

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
    code: json["code"],
    data: AgentData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "status": status,
  };
}

class AgentData {
  AgentData({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.tag,
    @required this.address,
    @required this.geolocation,
    @required this.role,
    @required this.dpLink,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String tag;
  final String address;
  final List<dynamic> geolocation;
  final String role;
  final dynamic dpLink;

  factory AgentData.fromJson(Map<String, dynamic> json) => AgentData(
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

