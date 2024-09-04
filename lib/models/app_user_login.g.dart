// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppUserLoginAdapter extends TypeAdapter<AppUserLogin> {
  @override
  final int typeId = 1;

  @override
  AppUserLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppUserLogin(
      isFirst: fields[0] as bool,
      token: fields[1] as String,
      cClient: fields[2] as bool?,
      isAppstore: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AppUserLogin obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isFirst)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.cClient)
      ..writeByte(3)
      ..write(obj.isAppstore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUserLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
