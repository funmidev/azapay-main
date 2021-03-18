// To parse this JSON data, do
//
//     final customAgentData = customAgentDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CustomAgentInfo customAgentDataFromJson(String str) => CustomAgentInfo.fromJson(json.decode(str));

String customAgentDataToJson(CustomAgentInfo data) => json.encode(data.toJson());

class CustomAgentInfo {
  CustomAgentInfo({
    @required this.code,
    @required this.data,
    @required this.status,
  });

  final String code;
  final List<CustomDatum> data;
  final int status;

  factory CustomAgentInfo.fromJson(Map<String, dynamic> json) => CustomAgentInfo(
    code: json["code"],
    data: List<CustomDatum>.from(json["data"].map((x) => CustomDatum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class CustomDatum {
  CustomDatum({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.tag,
    @required this.gender,
    @required this.dob,
    @required this.bvn,
    @required this.address,
    @required this.state,
    @required this.uidAcceptanceStatus,
    @required this.accountType,
    @required this.role,
    @required this.rc,
    @required this.businessName,
    @required this.businessAddress,
    @required this.country,
    @required this.dpLink,
    @required this.cashier,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String tag;
  final String gender;
  final Dob dob;
  final dynamic bvn;
  final String address;
  final String state;
  final bool uidAcceptanceStatus;
  final String accountType;
  final String role;
  final String rc;
  final String businessName;
  final String businessAddress;
  final String country;
  final dynamic dpLink;
  final List<Cashier> cashier;

  factory CustomDatum.fromJson(Map<String, dynamic> json) => CustomDatum(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    tag: json["tag"],
    gender: json["gender"],
    dob: Dob.fromJson(json["dob"]),
    bvn: json["bvn"],
    address: json["address"],
    state: json["state"],
    uidAcceptanceStatus: json["uidAcceptanceStatus"],
    accountType: json["accountType"],
    role: json["role"],
    rc: json["rc"],
    businessName: json["businessName"],
    businessAddress: json["businessAddress"],
    country: json["country"],
    dpLink: json["dpLink"],
    cashier: List<Cashier>.from(json["cashier"].map((x) => Cashier.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "tag": tag,
    "gender": gender,
    "dob": dob.toJson(),
    "bvn": bvn,
    "address": address,
    "state": state,
    "uidAcceptanceStatus": uidAcceptanceStatus,
    "accountType": accountType,
    "role": role,
    "rc": rc,
    "businessName": businessName,
    "businessAddress": businessAddress,
    "country": country,
    "dpLink": dpLink,
    "cashier": List<dynamic>.from(cashier.map((x) => x.toJson())),
  };
}

class Cashier {
  Cashier({
    @required this.firstName,
    @required this.lastName,
    @required this.phone,
    @required this.gender,
    @required this.cashTill,
    @required this.enabled,
    @required this.accountType,
    @required this.role,
    @required this.dpLink,
    @required this.roles,
  });

  final String firstName;
  final String lastName;
  final String phone;
  final String gender;
  final String cashTill;
  final bool enabled;
  final String accountType;
  final String role;
  final dynamic dpLink;
  final List<Role> roles;

  factory Cashier.fromJson(Map<String, dynamic> json) => Cashier(
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    gender: json["gender"],
    cashTill: json["cashTill"],
    enabled: json["enabled"],
    accountType: json["accountType"],
    role: json["role"],
    dpLink: json["dpLink"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "gender": gender,
    "cashTill": cashTill,
    "enabled": enabled,
    "accountType": accountType,
    "role": role,
    "dpLink": dpLink,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    @required this.createdAt,
    @required this.modifiedAt,
    @required this.hash,
    @required this.role,
    @required this.abilities,
  });

  final DateTime createdAt;
  final DateTime modifiedAt;
  final String hash;
  final String role;
  final List<String> abilities;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    hash: json["hash"],
    role: json["role"],
    abilities: List<String>.from(json["abilities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "hash": hash,
    "role": role,
    "abilities": List<dynamic>.from(abilities.map((x) => x)),
  };
}

class Dob {
  Dob({
    @required this.day,
    @required this.month,
    @required this.year,
  });

  final String day;
  final String month;
  final String year;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    day: json["day"],
    month: json["month"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "month": month,
    "year": year,
  };
}
