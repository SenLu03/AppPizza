import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../call_API/put_api.dart';
import 'AppControler.dart';

class ChangePassController extends GetxController {
  late BuildContext context;
  final TextEditingController passWordcontroller = TextEditingController();
  final TextEditingController confirmPassWordController =
      TextEditingController();

  RxBool isVisible = false.obs;
  bool isVisibleConfirm = false;
  RxBool isSuccess = false.obs;

  RxBool isPasswordEightCharacters = false.obs;
  bool hasPasswordOneNumber = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;

  RxBool isLoading = false.obs;

  String message='';

  onPasswordChanged(String password) {
    final numbericRegex = RegExp(r'[0-9]');
    final specialRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final upperCaseRegex = RegExp(r'[A-Z]');

    isPasswordEightCharacters = false.obs;
    if (password.length >= 8) {
      isPasswordEightCharacters = true.obs;
    }
    hasPasswordOneNumber = false;
    if (numbericRegex.hasMatch(password)) {
      hasPasswordOneNumber = true;
    }
    hasUpperCase = false;
    if (upperCaseRegex.hasMatch(password)) {
      hasUpperCase = true;
    }
    hasSpecialCharacters = false;
    if (specialRegex.hasMatch(password)) {
      hasSpecialCharacters = true;
    }

  }

  onPressChangePass() async {
    Get.find<AppControleer>().currentUser.password=passWordcontroller.text;
    isLoading.value = true;
    Future.delayed(Duration(seconds: 3), () {
      // Sau khi chờ xong,
      // Đồng thời, tắt trạng thái "loading"
      isLoading.value = false;
    });

    message=await PutApi.updateAccount( Get.find<AppControleer>().currentUser);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,)));
  }
}
