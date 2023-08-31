import 'package:btl_flutter/controller/cart_controller.dart';
import 'package:get/get.dart';
class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CartController);
    // TODO: implement dependencies
  }

}