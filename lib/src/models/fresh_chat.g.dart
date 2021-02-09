// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fresh_chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FreshChatAdapter extends TypeAdapter<FreshChat> {
  @override
  final int typeId = 13;

  @override
  FreshChat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FreshChat(
      restoreId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FreshChat obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.restoreId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FreshChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
