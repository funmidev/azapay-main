// To parse this JSON data, do
//
//     final merchantResponse = merchantResponseFromJson(jsonString);

import 'dart:convert';

MerchantResponse merchantResponseFromJson(String str) =>
    MerchantResponse.fromJson(json.decode(str));

String merchantResponseToJson(MerchantResponse data) =>
    json.encode(data.toJson());

class MerchantResponse {
  MerchantResponse({
    this.code,
    this.data,
    this.status,
  });

  String code;
  List<Datum> data;
  int status;

  factory MerchantResponse.fromJson(Map<String, dynamic> json) =>
      MerchantResponse(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Datum {
  Datum({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.tag,
    this.gender,
    this.dob,
    this.bvn,
    this.address,
    this.state,
    this.uidAcceptanceStatus,
    this.accountType,
    this.role,
    this.rc,
    this.businessName,
    this.businessAddress,
    this.country,
    this.dpLink,
    this.cashier,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String tag;
  String gender;
  Dob dob;
  dynamic bvn;
  String address;
  String state;
  bool uidAcceptanceStatus;
  String accountType;
  String role;
  String rc;
  String businessName;
  String businessAddress;
  String country;
  dynamic dpLink;
  List<Cashier> cashier;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        cashier:
            List<Cashier>.from(json["cashier"].map((x) => Cashier.fromJson(x))),
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
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.cashTill,
    this.enabled,
    this.accountType,
    this.role,
    this.dpLink,
    this.roles,
  });

  String firstName;
  String lastName;
  String phone;
  String gender;
  String cashTill;
  bool enabled;
  String accountType;
  String role;
  dynamic dpLink;
  List<Role> roles;

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
    this.createdAt,
    this.modifiedAt,
    this.hash,
    this.role,
    this.abilities,
  });

  DateTime createdAt;
  DateTime modifiedAt;
  String hash;
  String role;
  List<String> abilities;

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
    this.day,
    this.month,
    this.year,
  });

  String day;
  String month;
  String year;

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
