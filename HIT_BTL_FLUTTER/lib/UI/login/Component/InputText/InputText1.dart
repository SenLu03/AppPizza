import 'package:btl_flutter/controller/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class InputText1 extends GetView<LoginScreenController> {

  InputText1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      height: 40.sp,
      child: TextField(
        controller: controller.emailController,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Color(0x891c1a1a),
        ),
        decoration: const InputDecoration(
          hintText: 'Tên đăng nhập',
          hintStyle: TextStyle(
            color: Color(0xFFD0D0D0),
            fontSize: 20,
            fontFamily: 'Blinker',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Align(
              widthFactor: 1.0, heightFactor: 1.0, child: Icon(Icons.person)),
        ),
      ),
    );
  }
}
