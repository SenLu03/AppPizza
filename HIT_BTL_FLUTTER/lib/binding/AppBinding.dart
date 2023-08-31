import 'package:btl_flutter/controller/AppControler.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AppControleer());
  }

}