import 'package:btl_flutter/controller/main_screen_controller.dart';
import 'package:get/get.dart';
class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainScreenController());
  }

}