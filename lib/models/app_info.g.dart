// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppInfoAdapter extends TypeAdapter<AppInfo> {
  @override
  final int typeId = 0;

  @override
  AppInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppInfo(
      appName: fields[0] as String,
      packageName: fields[1] as String,
      version: fields[2] as String,
      buildNumber: fields[3] as String,
      buildSignature: fields[4] as String,
      installerStore: fields[5] as String,
      deviceUUID: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.appName)
      ..writeByte(1)
      ..write(obj.packageName)
      ..writeByte(2)
      ..write(obj.version)
      ..writeByte(3)
      ..write(obj.buildNumber)
      ..writeByte(4)
      ..write(obj.buildSignature)
      ..writeByte(5)
      ..write(obj.installerStore)
      ..writeByte(6)
      ..write(obj.deviceUUID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
