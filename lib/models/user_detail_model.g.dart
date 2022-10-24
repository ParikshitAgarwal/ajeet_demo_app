// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailAdapter extends TypeAdapter<UserDetail> {
  @override
  final int typeId = 0;

  @override
  UserDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetail(
      id: fields[1] as String,
      atype: fields[2] as String,
      name: fields[0] as String,
      age: fields[3] as String?,
      gender: fields[4] as String?,
      isLoggedIn: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.atype)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
