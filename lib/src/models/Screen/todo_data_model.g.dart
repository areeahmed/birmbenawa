// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TODOAdapter extends TypeAdapter<TODO> {
  @override
  final int typeId = 0;

  @override
  TODO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TODO(
      title: fields[0] as String,
      Description: fields[1] as String,
      isChecked: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TODO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.Description)
      ..writeByte(2)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TODOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
