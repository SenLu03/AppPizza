import 'package:btl_flutter/controller/see_order_controller.dart';
import 'package:get/get.dart';

class SeeOrderBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SeeOrderController());
  }
}