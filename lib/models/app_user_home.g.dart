// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_home.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppUserHomeAdapter extends TypeAdapter<AppUserHome> {
  @override
  final int typeId = 2;

  @override
  AppUserHome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppUserHome(
      fields[1] as int,
      (fields[2] as List).cast<dynamic>(),
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
      fields[6] as int,
      fields[7] as String?,
      fields[8] as String,
      (fields[9] as Map).cast<dynamic, dynamic>(),
      fields[10] as String,
      fields[11] as String,
      fields[12] as int,
      fields[13] as String,
      fields[14] as int,
      fields[15] as String?,
      fields[16] as String?,
      fields[17] as int,
      fields[18] as String,
      fields[19] as int,
      fields[20] as String,
      fields[21] as bool,
      fields[22] as String,
      fields[23] as String,
      (fields[24] as Map).cast<dynamic, dynamic>(),
      (fields[25] as Map).cast<dynamic, dynamic>(),
      (fields[26] as List).cast<dynamic>(),
      (fields[27] as List).cast<dynamic>(),
      fields[28] as int,
      u_Role: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AppUserHome obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.u_Role)
      ..writeByte(1)
      ..write(obj.isSetPwd)
      ..writeByte(2)
      ..write(obj.u_Account)
      ..writeByte(3)
      ..write(obj.u_Mobile)
      ..writeByte(4)
      ..write(obj.u_Mobile2)
      ..writeByte(5)
      ..write(obj.isMobile)
      ..writeByte(6)
      ..write(obj.u_Type)
      ..writeByte(7)
      ..write(obj.u_Name)
      ..writeByte(8)
      ..write(obj.u_Signature)
      ..writeByte(9)
      ..write(obj.authentication)
      ..writeByte(10)
      ..write(obj.u_Number)
      ..writeByte(11)
      ..write(obj.nickName)
      ..writeByte(12)
      ..write(obj.u_ChildFlag)
      ..writeByte(13)
      ..write(obj.userAvatar)
      ..writeByte(14)
      ..write(obj.uFlag)
      ..writeByte(15)
      ..write(obj.expiredTime)
      ..writeByte(16)
      ..write(obj.u_Pass_Date)
      ..writeByte(17)
      ..write(obj.uLevel)
      ..writeByte(18)
      ..write(obj.uLevelName)
      ..writeByte(19)
      ..write(obj.uIsBuy)
      ..writeByte(20)
      ..write(obj.u_3rd_password)
      ..writeByte(21)
      ..write(obj.userHasU3rdPwd)
      ..writeByte(22)
      ..write(obj.sp_Mobile)
      ..writeByte(23)
      ..write(obj.sp_Name)
      ..writeByte(24)
      ..write(obj.homeTeamTanNo)
      ..writeByte(25)
      ..write(obj.selfBounsInfo)
      ..writeByte(26)
      ..write(obj.news)
      ..writeByte(27)
      ..write(obj.appHomeNews)
      ..writeByte(28)
      ..write(obj.isAgent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUserHomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
