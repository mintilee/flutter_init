import 'package:get/get.dart';

class DatasController extends GetxController {
  final terminalData = [
    {"terTotal": 6245, "merTota": 1098, "isBinding": 342, "isActivate": 37, "isAchieved": 12},
    {"terTotal": 6000, "merTota": 1000, "isBinding": 300, "isActivate": 30, "isAchieved": 10},
    {"terTotal": 5000, "merTota": 800, "isBinding": 260, "isActivate": 25, "isAchieved": 8},
  ];

  final terminalCurrent = RxInt(0);
}
