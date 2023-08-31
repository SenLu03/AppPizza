import 'package:btl_flutter/UI/Widget/app_color.dart';
import 'package:btl_flutter/UI/Widget/app_image_widget.dart';
import 'package:btl_flutter/controller/forgot_pass_word_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/AppImage.dart';

class ForgotPassWordScreen1 extends GetView<ForgotPassWordController> {
  const ForgotPassWordScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Get.height / 15),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  child: AppImageWidget.asset(
                    path: AppImage.icBack,
                    width: 16 * fem,
                    height: 16 * fem,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  width: 70.sp,
                ),
                AppImageWidget.asset(
                  path: AppImage.headerLogo,
                  height: 30.sp,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff444444),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(() =>
            !controller.statusSendPass.value? Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Vui lòng nhập lại username của bạn',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff444444),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    'Nhập username',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Container(
                height: 50.sp,
                margin: EdgeInsets.only(
                    bottom: 10.sp, left: 10.sp, right: 10.sp, top: 5.sp),
                padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  border: Border.all(color: AppColor.black),
                ),
                child: TextFormField(
                  obscureText: false,
                  controller: controller.inputEmailControler,
                  decoration: const InputDecoration(
                    hintText: 'string',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User không được trống';
                    }
                    // if (!controller.isValidEmail(value)) {
                    //   return 'Email không đúng quy cách';
                    // }
                    return null;
                  },
                ),
              ),
            ]) :
                Row(
                  children: [
                    SizedBox(width: 10.sp,),
                    const Icon(Icons.check_circle_outline_outlined,color: Colors.green,),
                    SizedBox(width: 5.sp,),
                    const Text('Mật khẩu mới đã được gửi đến email của bạn')
                  ],
                )
            ),
            InkWell(
              onTap: () {
                controller.statusConfirmEmail();
              },
              child: Container(
                  height: 50.sp,
                  width: Get.width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(19.sp),
                  decoration: const BoxDecoration(
                    color: AppColor.green,
                  ),
                  child: Obx(
                        () =>
                    !controller.isLoading.value
                        ? Text(
                      'Tiếp tục',
                      style:
                      TextStyle(fontSize: 20.sp, color: Colors.white),
                    )
                        : const CircularProgressIndicator(),
                  )),
            )
          ],
        ),
      ),
    );
  }

}
