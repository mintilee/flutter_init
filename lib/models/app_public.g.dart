// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_public.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppPublicAdapter extends TypeAdapter<AppPublic> {
  @override
  final int typeId = 3;

  @override
  AppPublic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppPublic(
      fields[0] as bool,
      fields[1] as WebSiteInfo,
      fields[2] as DrawInfo,
      fields[3] as SystemInfo,
      fields[4] as TransferInfo?,
    );
  }

  @override
  void write(BinaryWriter writer, AppPublic obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isCanCancel)
      ..writeByte(1)
      ..write(obj.webSiteInfo)
      ..writeByte(2)
      ..write(obj.drawInfo)
      ..writeByte(3)
      ..write(obj.systemInfo)
      ..writeByte(4)
      ..write(obj.transferInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPublicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DrawInfoAdapter extends TypeAdapter<DrawInfo> {
  @override
  final int typeId = 3;

  @override
  DrawInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrawInfo(
      accounts: (fields[0] as Map).cast<String, DrawAccount>(),
      draw_Account_PayType: (fields[1] as Map).cast<String, AccountInfo>(),
      draw_System_Hint: fields[2] as String,
      draw_Account_CheckMethod: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DrawInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accounts)
      ..writeByte(1)
      ..write(obj.draw_Account_PayType)
      ..writeByte(2)
      ..write(obj.draw_System_Hint)
      ..writeByte(3)
      ..write(obj.draw_Account_CheckMethod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DrawAccountAdapter extends TypeAdapter<DrawAccount> {
  @override
  final int typeId = 4;

  @override
  DrawAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrawAccount(
      draw_Account_SingleAmountMin: (fields[0] as List).cast<String>(),
      draw_Account_EveryDayAmountMax: fields[1] as double,
      draw_Account_ToAccountTypeByAmt: fields[2] as double,
      draw_Account_No: fields[3] as AccountInfo,
      draw_Account_SingleFee: fields[4] as int,
      draw_Account_AmountMultiple: fields[5] as double,
      draw_Account_EveryDayCountMax: fields[6] as int,
      draw_Account_ServiceCharges: fields[7] as double,
      draw_Account_ToAccountType: fields[8] as AccountInfo,
      draw_Account_SingleAmountMax: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DrawAccount obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.draw_Account_SingleAmountMin)
      ..writeByte(1)
      ..write(obj.draw_Account_EveryDayAmountMax)
      ..writeByte(2)
      ..write(obj.draw_Account_ToAccountTypeByAmt)
      ..writeByte(3)
      ..write(obj.draw_Account_No)
      ..writeByte(4)
      ..write(obj.draw_Account_SingleFee)
      ..writeByte(5)
      ..write(obj.draw_Account_AmountMultiple)
      ..writeByte(6)
      ..write(obj.draw_Account_EveryDayCountMax)
      ..writeByte(7)
      ..write(obj.draw_Account_ServiceCharges)
      ..writeByte(8)
      ..write(obj.draw_Account_ToAccountType)
      ..writeByte(9)
      ..write(obj.draw_Account_SingleAmountMax);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountInfoAdapter extends TypeAdapter<AccountInfo> {
  @override
  final int typeId = 5;

  @override
  AccountInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountInfo(
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SystemInfoAdapter extends TypeAdapter<SystemInfo> {
  @override
  final int typeId = 6;

  @override
  SystemInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemInfo(
      system: fields[0] as System,
    );
  }

  @override
  void write(BinaryWriter writer, SystemInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.system);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SystemAdapter extends TypeAdapter<System> {
  @override
  final int typeId = 7;

  @override
  System read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return System(
      system_IsLoginCheckIP: fields[0] as int,
      share_No: fields[1] as String,
      system_WeChatQRCode: fields[2] as String,
      system_ServiceHotline: fields[3] as String,
      system_CollectionCode: fields[4] as String,
      system_DataCenterOrganNO: fields[5] as String,
      system_WeChatOfficial: fields[6] as String,
      system_WeChat: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, System obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.system_IsLoginCheckIP)
      ..writeByte(1)
      ..write(obj.share_No)
      ..writeByte(2)
      ..write(obj.system_WeChatQRCode)
      ..writeByte(3)
      ..write(obj.system_ServiceHotline)
      ..writeByte(4)
      ..write(obj.system_CollectionCode)
      ..writeByte(5)
      ..write(obj.system_DataCenterOrganNO)
      ..writeByte(6)
      ..write(obj.system_WeChatOfficial)
      ..writeByte(7)
      ..write(obj.system_WeChat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransferInfoAdapter extends TypeAdapter<TransferInfo> {
  @override
  final int typeId = 8;

  @override
  TransferInfo read(BinaryReader reader) {
    return TransferInfo();
  }

  @override
  void write(BinaryWriter writer, TransferInfo obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppConfigAdapter extends TypeAdapter<AppConfig> {
  @override
  final int typeId = 9;

  @override
  AppConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppConfig(
      groupSeckill: fields[0] as String,
      hotRecommend: fields[1] as String,
      shareBanner: fields[2] as String,
      equityIcon: fields[3] as String,
      topBanner: fields[4] as String,
      middleIcon: fields[5] as String,
      topBackImage: fields[6] as String,
      myBackImage: fields[7] as String,
      serverIcon: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppConfig obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.groupSeckill)
      ..writeByte(1)
      ..write(obj.hotRecommend)
      ..writeByte(2)
      ..write(obj.shareBanner)
      ..writeByte(3)
      ..write(obj.equityIcon)
      ..writeByte(4)
      ..write(obj.topBanner)
      ..writeByte(5)
      ..write(obj.middleIcon)
      ..writeByte(6)
      ..write(obj.topBackImage)
      ..writeByte(7)
      ..write(obj.myBackImage)
      ..writeByte(8)
      ..write(obj.serverIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
