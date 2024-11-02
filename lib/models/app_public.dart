import 'package:hive_flutter/hive_flutter.dart';
part 'app_public.g.dart';

@HiveType(typeId: 3)
class AppPublic extends HiveObject {
  @HiveField(0)
  final bool isCanCancel;
  @HiveField(1)
  final WebSiteInfo webSiteInfo;
  @HiveField(2)
  final DrawInfo drawInfo;
  @HiveField(3)
  final SystemInfo systemInfo;
  @HiveField(4)
  final TransferInfo? transferInfo;

  AppPublic(
    this.isCanCancel,
    this.webSiteInfo,
    this.drawInfo,
    this.systemInfo,
    this.transferInfo,
  );

  factory AppPublic.fromJson(Map<String, dynamic> json) {
    return AppPublic(
      json['isCanCancel'],
      json['webSiteInfo'],
      json['drawInfo'],
      json['systemInfo'],
      json['transferInfo'],
    );
  }
}

@HiveField(1)
class WebSiteInfo extends HiveObject {
  @HiveField(0)
  final SiteApp app;

  WebSiteInfo({required this.app});
}

@HiveField(2)
class SiteApp extends HiveObject {
  @HiveField(0)
  final String apP_ExternalReg_Url;
  @HiveField(1)
  final String apP_Images_Url;
  @HiveField(2)
  final String apP_SubTitle;
  @HiveField(3)
  final String apP_No;
  @HiveField(4)
  final String apP_Introduction;
  @HiveField(5)
  final String apP_Logo;
  @HiveField(6)
  final String apP_Copyright;
  @HiveField(7)
  final String apP_Name;

  SiteApp({
    required this.apP_ExternalReg_Url,
    required this.apP_Images_Url,
    required this.apP_SubTitle,
    required this.apP_No,
    required this.apP_Introduction,
    required this.apP_Logo,
    required this.apP_Copyright,
    required this.apP_Name,
  });
}

@HiveType(typeId: 3)
class DrawInfo extends HiveObject {
  @HiveField(0)
  final Map<String, DrawAccount> accounts;
  @HiveField(1)
  final Map<String, AccountInfo> draw_Account_PayType;
  @HiveField(2)
  final String draw_System_Hint;
  @HiveField(3)
  final int draw_Account_CheckMethod;

  DrawInfo({
    required this.accounts,
    required this.draw_Account_PayType,
    required this.draw_System_Hint,
    required this.draw_Account_CheckMethod,
  });
}

@HiveType(typeId: 4)
class DrawAccount extends HiveObject {
  @HiveField(0)
  final List<String> draw_Account_SingleAmountMin;
  @HiveField(1)
  final double draw_Account_EveryDayAmountMax;
  @HiveField(2)
  final double draw_Account_ToAccountTypeByAmt;
  @HiveField(3)
  final AccountInfo draw_Account_No;
  @HiveField(4)
  final int draw_Account_SingleFee;
  @HiveField(5)
  final double draw_Account_AmountMultiple;
  @HiveField(6)
  final int draw_Account_EveryDayCountMax;
  @HiveField(7)
  final double draw_Account_ServiceCharges;
  @HiveField(8)
  final AccountInfo draw_Account_ToAccountType;
  @HiveField(9)
  final double draw_Account_SingleAmountMax;

  DrawAccount({
    required this.draw_Account_SingleAmountMin,
    required this.draw_Account_EveryDayAmountMax,
    required this.draw_Account_ToAccountTypeByAmt,
    required this.draw_Account_No,
    required this.draw_Account_SingleFee,
    required this.draw_Account_AmountMultiple,
    required this.draw_Account_EveryDayCountMax,
    required this.draw_Account_ServiceCharges,
    required this.draw_Account_ToAccountType,
    required this.draw_Account_SingleAmountMax,
  });
}

@HiveType(typeId: 5)
class AccountInfo extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;

  AccountInfo({
    required this.id,
    required this.text,
  });
}

@HiveType(typeId: 6)
class SystemInfo extends HiveObject {
  @HiveField(0)
  final System system;

  SystemInfo({
    required this.system,
  });
}

@HiveType(typeId: 7)
class System extends HiveObject {
  @HiveField(0)
  final int system_IsLoginCheckIP;
  @HiveField(1)
  final String share_No;
  @HiveField(2)
  final String system_WeChatQRCode;
  @HiveField(3)
  final String system_ServiceHotline;

  @HiveField(4)
  final String system_CollectionCode;
  @HiveField(5)
  final String system_DataCenterOrganNO;
  @HiveField(6)
  final String system_WeChatOfficial;
  @HiveField(7)
  final String system_WeChat;

  System({
    required this.system_IsLoginCheckIP,
    required this.share_No,
    required this.system_WeChatQRCode,
    required this.system_ServiceHotline,
    required this.system_CollectionCode,
    required this.system_DataCenterOrganNO,
    required this.system_WeChatOfficial,
    required this.system_WeChat,
  });
}

@HiveType(typeId: 8)
class TransferInfo extends HiveObject {}

@HiveType(typeId: 9)
class AppConfig extends HiveObject {
  @HiveField(0)
  final String groupSeckill;
  @HiveField(1)
  final String hotRecommend;
  @HiveField(2)
  final String shareBanner;
  @HiveField(3)
  final String equityIcon;
  @HiveField(4)
  final String topBanner;
  @HiveField(5)
  final String middleIcon;
  @HiveField(6)
  final String topBackImage;
  @HiveField(7)
  final String myBackImage;
  @HiveField(8)
  final String serverIcon;

  AppConfig({
    required this.groupSeckill,
    required this.hotRecommend,
    required this.shareBanner,
    required this.equityIcon,
    required this.topBanner,
    required this.middleIcon,
    required this.topBackImage,
    required this.myBackImage,
    required this.serverIcon,
  });
}
