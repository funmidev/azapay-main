// To parse this JSON data, do
//
//     final getUserInfoResp = getUserInfoRespFromJson(jsonString);

import 'dart:convert';

GetUserInfoResp getUserInfoRespFromJson(String str) {
  return GetUserInfoResp.fromJson(json.decode(str));
}

String getUserInfoRespToJson(GetUserInfoResp data) =>
    json.encode(data.toJson());

class GetUserInfoResp {
  GetUserInfoResp({
    this.code,
    this.data,
    this.status,
  });

  String code;
  Data data;
  int status;

  factory GetUserInfoResp.fromJson(Map<String, dynamic> json) =>
      GetUserInfoResp(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "status": status,
      };
}

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.tag,
    this.gender,
    this.dateOfBirth,
    this.bvn,
    this.address,
    this.state,
    this.country,
    this.uidAcceptanceStatus,
    this.accountType,
    this.role,
    this.dpLink,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String tag;
  String gender;
  String dateOfBirth;
  bool bvn;
  String address;
  String state;
  String country;
  bool uidAcceptanceStatus;
  String accountType;
  String role;
  dynamic dpLink;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        tag: json["tag"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        bvn: json["bvn"],
        address: json["address"],
        state: json["state"],
        country: json["country"],
        uidAcceptanceStatus: json["uidAcceptanceStatus"],
        accountType: json["accountType"],
        role: json["role"],
        dpLink: json["dpLink"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "tag": tag,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "bvn": bvn,
        "address": address,
        "state": state,
        "country": country,
        "uidAcceptanceStatus": uidAcceptanceStatus,
        "accountType": accountType,
        "role": role,
        "dpLink": dpLink,
      };
}
