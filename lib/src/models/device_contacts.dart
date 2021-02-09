import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_contacts.g.dart';

@HiveType(typeId: 10)
@JsonSerializable(nullable: false)
class DeviceContacts {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String number;

  DeviceContacts({this.title, this.number});

  factory DeviceContacts.fromJson(Map<String, dynamic> json) => _$DeviceContactsFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceContactsToJson(this);
}
