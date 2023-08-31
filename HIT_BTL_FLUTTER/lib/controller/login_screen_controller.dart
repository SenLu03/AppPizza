import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/call_API/post_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/User.dart';

class LoginScreenController extends GetxController {
  late BuildContext context;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  RxBool isDisplayPass = false.obs;

  late User userLogin;

  RxBool isLoading = false.obs;
  late RxBool isLogin = true.obs;

  Future<void> postLoginAPI() async {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 3), () {
      // Sau khi chờ xong, đặt giá trị của statusSendPass thành true
      // Đồng thời, tắt trạng thái "loading"
      isLoading.value = false;
    });
    isLogin.value =
        await PostAPI.postLogin(emailController.text, passwordController.text);
    if (isLogin.value) {
      emailController.clear();
      passwordController.clear();
      Get.toNamed(AppRouter.stateMainScreen);
    }
  }
}
