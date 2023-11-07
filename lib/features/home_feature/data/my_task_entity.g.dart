// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTextAdapter extends TypeAdapter<MyText> {
  @override
  final int typeId = 0;

  @override
  MyText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyText(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyText obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
