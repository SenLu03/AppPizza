import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/login_screen_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputPassword extends GetView<LoginScreenController> {


  InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 300.sp,
      height: 40.sp,
      child: Obx(() => TextField(
        controller: controller.passwordController,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            hintText: 'Mật khẩu',
            hintStyle: const TextStyle(
              color: Color(0xFFD0D0D0),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: const Align(
                widthFactor: 1.0, heightFactor: 1.0, child: Icon(Icons.lock)),
            suffixIcon: IconButton(onPressed:(){
              controller.isDisplayPass.value=!controller.isDisplayPass.value;
            },
                icon:controller.isDisplayPass.value?Icon(Icons.visibility):Icon(Icons.visibility_off))),
        obscureText: controller.isDisplayPass.value,
      ),
    ));
  }
}
