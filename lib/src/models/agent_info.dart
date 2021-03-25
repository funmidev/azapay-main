// To parse this JSON data, do
//
//     final agentModelData = agentModelDataFromJson(jsonString);

import 'dart:convert';

import 'package:azapay/service/get_aza_agent_info.dart';

AgentModelData agentModelDataFromJson(String str) => AgentModelData.fromJson(json.decode(str));

String agentModelDataToJson(AgentModelData data) => json.encode(data.toJson());

class AgentModelData {
  AgentModelData({
    this.code,
    this.data,
    this.status,
  });

  String code;
  List<AgentData> data;
  int status;

  factory AgentModelData.fromJson(Map<String, dynamic> json) => AgentModelData(
    code: json["code"],
    data: List<AgentData>.from(json["data"].map((x) => AgentData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

