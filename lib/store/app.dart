import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:offline/models/app_info.dart';

import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  static const String BASE_URL = "http://192.168.1.51:1027";
  static const int NETWORKID = 2;
}

class AppStore {
  static const String appInfoStore = "appInfo";
  final Box<AppInfo> box = Hive.box<AppInfo>(appInfoStore);

  static Future<void> init() async {
    await Hive.openBox<AppInfo>(appInfoStore);
  }

  // 获取app里面的相关信息
  Future<void> appInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String deviceId = "";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!; // 使用identifierForVendor作为唯一标识
    } else if (kIsWeb) {
      deviceId = "web";
    }

    await box.put(
        'appinfo',
        AppInfo(
          deviceUUID: deviceId,
          appName: packageInfo.appName,
          packageName: packageInfo.packageName,
          version: packageInfo.version,
          buildNumber: packageInfo.buildNumber,
          buildSignature: packageInfo.buildSignature,
          installerStore: packageInfo.installerStore!,
        ));
  }

  // 得到app里面的相关信息
  Future<AppInfo?> getAppInfo() async {
    return box.get('appinfo');
  }
}
