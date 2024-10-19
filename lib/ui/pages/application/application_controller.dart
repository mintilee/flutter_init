import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final _tabbarIndex = 0.obs;
  get tabbarIndex => _tabbarIndex.value;
  set tabbarIndex(value) => _tabbarIndex.value = value;
}
