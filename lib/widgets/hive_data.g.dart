// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppsListAdapter extends TypeAdapter<AppsList> {
  @override
  final int typeId = 1;

  @override
  AppsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppsList(
      name: fields[0] as String,
      icon: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, AppsList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
