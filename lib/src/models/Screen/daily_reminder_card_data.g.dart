// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reminder_card_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyReminderCardDataAdapter extends TypeAdapter<DailyReminderCardData> {
  @override
  final int typeId = 0;

  @override
  DailyReminderCardData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyReminderCardData(
      title: fields[0] as String,
      descriptionOfCard: fields[1] as String,
      hour: fields[2] as int,
      minute: fields[3] as int,
      pmOrAm: fields[4] as String,
      dayOfWeek: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DailyReminderCardData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.descriptionOfCard)
      ..writeByte(2)
      ..write(obj.hour)
      ..writeByte(3)
      ..write(obj.minute)
      ..writeByte(4)
      ..write(obj.pmOrAm)
      ..writeByte(5)
      ..write(obj.dayOfWeek);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyReminderCardDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
