import 'package:hive_flutter/hive_flutter.dart';
part 'app_info.g.dart';

@HiveType(typeId: 0)
class AppInfo extends HiveObject {
  @HiveField(0)
  final String appName;
  @HiveField(1)
  final String packageName;
  @HiveField(2)
  final String version;
  @HiveField(3)
  final String buildNumber;
  @HiveField(4)
  final String buildSignature;
  @HiveField(5)
  final String installerStore;
  @HiveField(6)
  final String? deviceUUID;

  AppInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    required this.installerStore,
    this.deviceUUID,
  });

// /// create new Task
//   factory Task.create({
//     required String? title,
//     required String? subtitle,
//     DateTime? createdAtTime,
//     DateTime? createdAtDate,
//   }) =>
//       Task(
//         id: const Uuid().v1(),
//         title: title ?? "",
//         subtitle: subtitle ?? "",
//         createdAtTime: createdAtTime ?? DateTime.now(),
//         isCompleted: false,
//         createdAtDate: createdAtDate ?? DateTime.now(),
//       );
}
