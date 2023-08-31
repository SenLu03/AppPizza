import 'package:btl_flutter/call_API/post_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassWordController extends GetxController{
  late BuildContext context;
  TextEditingController inputEmailControler=TextEditingController();
  RxBool isLoading=false.obs;
  RxBool statusSendPass=false.obs;
  bool isValidEmail(String email) {
    // Sử dụng biểu thức chính quy để kiểm tra tính hợp lệ của địa chỉ email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

  void statusConfirmEmail(){
    isLoading.value=true;
    PostAPI.forgotPassword(inputEmailControler.text);
    Future.delayed(Duration(seconds: 3), () {
      // Sau khi chờ xong, đặt giá trị của statusSendPass thành true
      statusSendPass.value = true;
      // Đồng thời, tắt trạng thái "loading"
      isLoading.value = false;
    });
  }

}