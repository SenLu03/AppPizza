import 'package:btl_flutter/controller/change_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/app_color.dart';
import '../login/Component/Logo/Logo.dart';
class ChangePassScreen extends GetView<ChangePassController>{
  @override
  Widget build(BuildContext context) {
    controller.context=context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
         onPressed: ()=>Get.back(),
          color: Colors.black,
        ),
        title:  const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
          ],
        ),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 10.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đổi mật khẩu',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Text(
                'Thay đổi mật khẩu mới',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: SizedBox(
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Mật khẩu",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                                fontSize: 15, color: Colors.red),
                          )
                        ],
                      ),
                      Obx(() =>
                          Container(
                            child: TextField(
                              onChanged: (password) =>
                                  controller.onPasswordChanged(password),
                              controller: controller.passWordcontroller,
                              obscureText: !controller.isVisible.value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.isVisible.value =
                                      !controller.isVisible.value;
                                    },
                                    icon: controller.isVisible.value
                                        ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                        : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: controller.isSuccess.value
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                  hintText: "Mật khẩu"),
                            ),
                          ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(children: [
                    const Row(
                      children: [
                        Text(
                          "Xác nhận mật khẩu",
                          style: TextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontSize: 15, color: Colors.red),
                        )
                      ],
                    ),
                    TextFormField(
                      controller: controller.confirmPassWordController,
                      obscureText: controller.isVisibleConfirm,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              {
                                controller.isVisibleConfirm =
                                !controller.isVisibleConfirm;
                              }
                            },
                            icon: controller.isVisibleConfirm
                                ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                                : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "Xác nhận mật khẩu",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide())),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Xác nhận mật khẩu của bạn";
                        }
                        if (controller.passWordcontroller.text !=
                            controller.confirmPassWordController.text) {
                          return "Mật khẩu không khớp";
                        }
                        return null;
                      },
                    ),
                  ]),
                )
              ]),
            ),
          ),
          const SizedBox(
            child: Text(
              "Mật khẩu bao gồm:",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w100),
            ),
          ),

          Row(
            children: [
              SizedBox(width: 10.sp,),
              Obx(
                    () => AnimatedContainer(
                  duration: const Duration(microseconds: 500),
                  width: 20,
                  height: 20,

                  /// goi qua .value
                  decoration: BoxDecoration(
                      color: controller.isPasswordEightCharacters.value
                          ? Colors.green
                          : Colors.transparent,
                      border: controller.isPasswordEightCharacters.value
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Bao gồm 8 kí tự")
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.sp,),
              AnimatedContainer(
                duration: const Duration(microseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: controller.hasPasswordOneNumber
                        ? Colors.green
                        : Colors.transparent,
                    border: controller.hasPasswordOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Chứa ít nhất 1 số")
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.sp,),
              AnimatedContainer(
                duration: const Duration(microseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: controller.hasUpperCase
                        ? Colors.green
                        : Colors.transparent,
                    border: controller.hasUpperCase
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Chứa ít nhất 1 kí tự  hoa")
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.sp,),
              AnimatedContainer(
                duration: const Duration(microseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: controller.hasSpecialCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: controller.hasSpecialCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Chứa ít nhất 1 kí tự đặc biệt")
            ],
          ),
          SizedBox(height: 10.sp,),
          Obx(() => controller.isLoading.value?
              const CircularProgressIndicator():
          Container(
            width: 150.sp,
            height: 50.sp,
            decoration: BoxDecoration(
              color: AppColor.green,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: TextButton(
              onPressed: ()=>controller.onPressChangePass(),
              child: Text('Xác nhận',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white
              ),),
            ),
          ),
          ),
        ],
      ),
    );
  }
}