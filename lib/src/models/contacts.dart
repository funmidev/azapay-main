import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contacts.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(nullable: false)
class Contacts {
  // @HiveField(0)
  // final String imageavatar;
  @HiveField(0)
  final String client;

  Contacts({this.client});

  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}
