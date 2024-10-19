import 'package:hive/hive.dart';
part 'app_user_home.g.dart';

@HiveType(typeId: 2)
class AppUserHome extends HiveObject {
  @HiveField(0)
  final int u_Role;

  @HiveField(1)
  final int isSetPwd;

  @HiveField(2)
  final List u_Account;

  @HiveField(3)
  final String u_Mobile;

  @HiveField(4)
  final String u_Mobile2;

  @HiveField(5)
  final int isMobile;

  @HiveField(6)
  final int u_Type;

  @HiveField(7)
  final String? u_Name;

  @HiveField(8)
  final String u_Signature;

  @HiveField(9)
  final Map authentication;

  @HiveField(10)
  final String u_Number;

  @HiveField(11)
  final String nickName;

  @HiveField(12)
  final int u_ChildFlag;

  @HiveField(13)
  final String userAvatar;

  @HiveField(14)
  final int uFlag;

  @HiveField(15)
  final String? expiredTime;

  @HiveField(16)
  final String? u_Pass_Date;

  @HiveField(17)
  final int uLevel;

  @HiveField(18)
  final String uLevelName;

  @HiveField(19)
  final int uIsBuy;

  @HiveField(20)
  final String u_3rd_password;

  @HiveField(21)
  final bool userHasU3rdPwd;

  @HiveField(22)
  final String sp_Mobile;

  @HiveField(23)
  final String sp_Name;

  @HiveField(24)
  final Map homeTeamTanNo;

  @HiveField(25)
  final Map selfBounsInfo;

  @HiveField(26)
  final List news;
  @HiveField(27)
  final List appHomeNews;
  @HiveField(28)
  final int isAgent;

  AppUserHome(
    this.isSetPwd,
    this.u_Account,
    this.u_Mobile,
    this.u_Mobile2,
    this.isMobile,
    this.u_Type,
    this.u_Name,
    this.u_Signature,
    this.authentication,
    this.u_Number,
    this.nickName,
    this.u_ChildFlag,
    this.userAvatar,
    this.uFlag,
    this.expiredTime,
    this.u_Pass_Date,
    this.uLevel,
    this.uLevelName,
    this.uIsBuy,
    this.u_3rd_password,
    this.userHasU3rdPwd,
    this.sp_Mobile,
    this.sp_Name,
    this.homeTeamTanNo,
    this.selfBounsInfo,
    this.news,
    this.appHomeNews,
    this.isAgent, {
    required this.u_Role,
  });

  factory AppUserHome.fromJson(Map<String, dynamic> json) {
    return AppUserHome(
      json['isSetPwd'],
      json['u_Account'],
      json['u_Mobile'],
      json['u_Mobile2'],
      json['isMobile'],
      json['u_Type'],
      json['u_Name'],
      json['u_Signature'],
      json['authentication'],
      json['u_Number'],
      json['nickName'],
      json['u_ChildFlag'],
      json['userAvatar'],
      json['uFlag'],
      json['expiredTime'],
      json['u_Pass_Date'],
      json['uLevel'],
      json['uLevelName'],
      json['uIsBuy'],
      json['u_3rd_password'],
      json['userHasU3rdPwd'],
      json['sp_Mobile'],
      json['sp_Name'],
      json['homeTeamTanNo'],
      json['selfBounsInfo'],
      json['news'],
      json['appHomeNews'],
      json['isAgent'],
      u_Role: json['u_Role'],
    );
  }
}
