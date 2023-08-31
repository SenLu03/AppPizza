import 'package:btl_flutter/controller/detal_controller.dart';
import 'package:get/get.dart';

class DetalBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetalController());
  }
}