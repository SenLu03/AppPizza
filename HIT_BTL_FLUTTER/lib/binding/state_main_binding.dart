import 'package:btl_flutter/controller/bogo_controller.dart';
import 'package:btl_flutter/controller/discount_controller.dart';
import 'package:btl_flutter/controller/menu_controller.dart';
import 'package:btl_flutter/controller/state_main_controller.dart';
import 'package:get/get.dart';

import '../controller/main_screen_controller.dart';
import '../controller/setting_controller.dart';

class StateMainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(StateMainController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(()=>MainScreenController());
    Get.lazyPut(() => MenuController());
    Get.lazyPut(() => DiscountController());

    /// Menu
    Get.lazyPut(() => BogoController());

  }
}