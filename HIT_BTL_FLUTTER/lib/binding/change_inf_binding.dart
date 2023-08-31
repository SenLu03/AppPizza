import 'package:btl_flutter/controller/change_inf_controller.dart';
import 'package:get/get.dart';

class ChangeInfBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangeInfController());
  }
}