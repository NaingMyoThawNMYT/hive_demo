// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyUserAdapter extends TypeAdapter<MyUser> {
  @override
  final int typeId = 0;

  @override
  MyUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyUser()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..createdDate = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, MyUser obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
