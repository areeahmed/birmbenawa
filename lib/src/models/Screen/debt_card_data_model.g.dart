// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_card_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebtCardDataModelAdapter extends TypeAdapter<DebtCardDataModel> {
  @override
  final int typeId = 0;

  @override
  DebtCardDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebtCardDataModel(
      nameTookDebt: fields[1] as String,
      debt: fields[2] as double,
      typeOfDebt: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DebtCardDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.nameTookDebt)
      ..writeByte(2)
      ..write(obj.debt)
      ..writeByte(3)
      ..write(obj.typeOfDebt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebtCardDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
