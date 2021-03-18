// To parse this JSON data, do
//
//     final withdrawalVialAgentResp = withdrawalVialAgentRespFromJson(jsonString);

import 'dart:convert';

WithdrawalVialAgentResp withdrawalVialAgentRespFromJson(String str) => WithdrawalVialAgentResp.fromJson(json.decode(str));

String withdrawalVialAgentRespToJson(WithdrawalVialAgentResp data) => json.encode(data.toJson());

class WithdrawalVialAgentResp {
  WithdrawalVialAgentResp({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  String code;
  Data data;
  String message;
  int status;

  factory WithdrawalVialAgentResp.fromJson(Map<String, dynamic> json) => WithdrawalVialAgentResp(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.createdAt,
    this.modifiedAt,
    this.pair,
    this.ref,
    this.hash,
    this.type,
    this.mode,
    this.amount,
    this.payerBalance,
    this.charge,
    this.status,
    this.note,
  });

  DateTime createdAt;
  DateTime modifiedAt;
  Pair pair;
  String ref;
  String hash;
  String type;
  String mode;
  int amount;
  int payerBalance;
  int charge;
  String status;
  String note;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    pair: Pair.fromJson(json["pair"]),
    ref: json["ref"],
    hash: json["hash"],
    type: json["type"],
    mode: json["mode"],
    amount: json["amount"],
    payerBalance: json["payerBalance"],
    charge: json["charge"],
    status: json["status"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "pair": pair.toJson(),
    "ref": ref,
    "hash": hash,
    "type": type,
    "mode": mode,
    "amount": amount,
    "payerBalance": payerBalance,
    "charge": charge,
    "status": status,
    "note": note,
  };
}

class Pair {
  Pair({
    this.fromKey,
    this.toKey,
    this.fromType,
    this.toType,
  });

  String fromKey;
  String toKey;
  String fromType;
  String toType;

  factory Pair.fromJson(Map<String, dynamic> json) => Pair(
    fromKey: json["from_key"],
    toKey: json["to_key"],
    fromType: json["from_type"],
    toType: json["to_type"],
  );

  Map<String, dynamic> toJson() => {
    "from_key": fromKey,
    "to_key": toKey,
    "from_type": fromType,
    "to_type": toType,
  };
}
