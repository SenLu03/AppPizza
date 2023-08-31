import 'package:btl_flutter/controller/change_pass_controller.dart';
import 'package:get/get.dart';

class ChangePassBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangePassController());
  }

}