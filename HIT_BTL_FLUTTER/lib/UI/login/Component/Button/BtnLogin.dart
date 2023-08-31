import 'package:btl_flutter/controller/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BtnLogin extends GetView<LoginScreenController> {
  const BtnLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isLoading.value
        ? Container(
            width: 177,
            height: 53,
            padding: EdgeInsets.all(10.sp),
            decoration: ShapeDecoration(
              color: const Color(0xFFE91414),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: TextButton(
              onPressed: () {
                controller.postLoginAPI();
              },
              child: const Text(
                'Đăng nhập',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.62,
                ),
              ),
            ))
        : const CircularProgressIndicator());
  }
}
