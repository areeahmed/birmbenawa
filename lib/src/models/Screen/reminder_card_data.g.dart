// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_card_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderCardDataAdapter extends TypeAdapter<ReminderCardData> {
  @override
  final int typeId = 0;

  @override
  ReminderCardData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderCardData(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as String,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderCardData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.descriptionOfCard)
      ..writeByte(2)
      ..write(obj.houre)
      ..writeByte(3)
      ..write(obj.minute)
      ..writeByte(4)
      ..write(obj.pmOrAm)
      ..writeByte(5)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderCardDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
