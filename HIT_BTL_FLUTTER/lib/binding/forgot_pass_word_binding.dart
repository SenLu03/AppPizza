import 'package:btl_flutter/controller/forgot_pass_word_controller.dart';
import 'package:get/get.dart';

class ForgotPassWordBingding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut(() => ForgotPassWordController());/// put
    Get.put(ForgotPassWordController());
  }

}