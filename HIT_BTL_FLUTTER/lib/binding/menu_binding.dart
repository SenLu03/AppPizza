import 'package:btl_flutter/controller/bogo_controller.dart';
import 'package:btl_flutter/controller/menu_controller.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MenuController());
    Get.lazyPut(() => BogoController());

  }
}