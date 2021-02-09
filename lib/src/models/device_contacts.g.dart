// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_contacts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceContactsAdapter extends TypeAdapter<DeviceContacts> {
  @override
  final int typeId = 10;

  @override
  DeviceContacts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceContacts(
      title: fields[0] as String,
      number: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceContacts obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceContactsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceContacts _$DeviceContactsFromJson(Map<String, dynamic> json) {
  return DeviceContacts(
    title: json['title'] as String,
    number: json['number'] as String,
  );
}

Map<String, dynamic> _$DeviceContactsToJson(DeviceContacts instance) =>
    <String, dynamic>{
      'title': instance.title,
      'number': instance.number,
    };
