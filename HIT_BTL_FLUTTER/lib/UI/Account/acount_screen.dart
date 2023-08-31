import 'package:btl_flutter/UI/login/Component/Logo/Logo.dart';
import 'package:btl_flutter/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget buildButton(String text, Function() onPressed) {
      return TextButton(
        onPressed: (){
          onPressed();
        },
        child: Container(
          margin:
              EdgeInsets.only(top: 5.sp, bottom: 5.sp, left: 10.sp, right: 10.sp),
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 5.0.sp,
              spreadRadius: 1.0.sp,
              color: Color.fromARGB(255, 125, 122, 122).withOpacity(0.5),
            )
          ]),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.green,
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        title: const Logo(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 18.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thành viên',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                final rotateTween = Tween<double>(begin: 1, end: 0);
                final rotateAnimation = rotateTween.animate(animation);
                return AnimatedBuilder(
                  animation: rotateAnimation,
                  builder: (context, child) {
                    // Chuyển đổi đơn vị góc từ độ sang radian
                    double radians = rotateAnimation.value *
                        3.14; // 180 degrees for horizontal flip
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(radians),
                      origin: const Offset(0.0, 0.0),
                      child: child,
                    );
                  },
                  child: child,
                );
              },
              child: !controller.viewInfor.value
                  ? InkWell(
                      key: const ValueKey('inkWell1'),
                      child: Container(
                        height: 100.sp,
                        margin: EdgeInsets.all(10.sp),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 159, 159, 159)
                                      .withOpacity(0.8),
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              height: 70.sp,
                              width: 70.sp,
                              margin: EdgeInsets.all(15.sp),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(244, 67, 54, 1),
                              ),
                            ),
                            Text(
                              'Xin chào ${controller.user?.userName}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        controller.viewInfor.value =
                            !controller.viewInfor.value,
                      },
                    )
                  : InkWell(
                      key: const ValueKey('inkWell2'),
                      child: Container(
                        padding: EdgeInsets.all(20.sp),
                        margin: EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 159, 159, 159)
                                  .withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 4)
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    'Tên khách hàng : ${controller.user?.fullName}',style: TextStyle(fontSize: 18,color: Colors.black),),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    'Số điện thoại: ${controller.user?.phoneNumber}',style: TextStyle(fontSize: 18,color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Email: ${controller.user?.email}',style: TextStyle(fontSize: 18,color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    'Ngày sinh: ${controller.formatBirthday(controller.user!.birthday)}',style: TextStyle(fontSize: 18,color: Colors.black)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Điểm: ${controller.user?.point}',style: TextStyle(fontSize: 18,color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        controller.viewInfor.value =
                            !controller.viewInfor.value,
                      },
                    ),
            ),
          ),
          buildButton('Đổi mật khẩu', () => controller.onPressChangePassWord()),
          buildButton(
              'Cập nhật thông tin', () => controller.onPressChangeInfo())
        ],
      ),
    );
  }
}
