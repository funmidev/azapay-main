// To parse this JSON data, do
//
//     final saveBeneficiary = saveBeneficiaryFromJson(jsonString);

import 'dart:convert';

SaveBeneficiaryModel saveBeneficiaryFromJson(String str) => SaveBeneficiaryModel.fromJson(json.decode(str));

String saveBeneficiaryToJson(SaveBeneficiaryModel data) => json.encode(data.toJson());

class SaveBeneficiaryModel {
  SaveBeneficiaryModel({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  String code;
  List<Datum> data;
  String message;
  int status;

  factory SaveBeneficiaryModel.fromJson(Map<String, dynamic> json) => SaveBeneficiaryModel(
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
