// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SelectedCartItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedCartItemAdapter extends TypeAdapter<SelectedCartItem> {
  @override
  final int typeId = 0;

  @override
  SelectedCartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedCartItem(
      fields[0] as String,
      fields[3] as String,
      fields[4] as String,
      fields[2] as String,
      fields[1] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedCartItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.realPrice)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.percent)
      ..writeByte(5)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedCartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
