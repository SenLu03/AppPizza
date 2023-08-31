import 'package:btl_flutter/controller/change_inf_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

import '../../res/AppImage.dart';
import '../Widget/app_image_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeInfScreen extends GetView<ChangeInfController>{
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
               Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          title: AppImageWidget.asset(path: AppImage.headerLogo),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    Column(children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: const Column(
                          children: [
                            Text(
                              "Đăng ký",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Vui lòng điền mẫu đơn đăng ký bên dưới",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      )
                    ]),
                    // ignore: avoid_unnecessary_containers
                    Name(),
                    const SizedBox(
                      height: 5,
                    ),
                    DateAndGender(context),
                    Phone(),
                    Address(),
                    const SizedBox(
                      height: 10,
                    ),
                    Email(),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                          () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromARGB(255, 60, 186, 64)),
                        onPressed: () {
                          if (controller.formKey.currentState!
                              .validate()) {
                            print("da nhap");
                            controller.onPressChange();
                          } else {
                            print("Chua nhap");
                          }
                        },
                        child: const Text("Tiếp theo"),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Container Email() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                "Email",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                "*",
                style: TextStyle(fontSize: 15, color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide()),
            ),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (email) =>
            !EmailValidator.validate(email!) ? "Nhập email của bạn" : null,
          ),
        ],
      ),
    );
  }




  Container Address() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                "Địa chỉ",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                "*",
                style: TextStyle(fontSize: 15, color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller.addressController,
            decoration: InputDecoration(
                hintText: "Địa chỉ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Nhập địa chỉ";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Container Phone() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                "Số điện thoại",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                "*",
                style: TextStyle(fontSize: 15, color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Nhập số điện thoại";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Container DateAndGender(BuildContext context) {
    return Container(
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
                      "Ngày sinh",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      "*",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )
                  ],
                ),
                TextFormField(
                  controller: controller.dateController,
                  decoration: InputDecoration(
                    hintText: "Ngày sinh",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide()),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat("yyyy-dd-MM").format(pickedDate);

                      controller.dateController.text = formattedDate.toString();
                    } else {
                      print("Not select");
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nhập ngày sinh";
                    }
                    return null;
                  },
                ),
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
                    "Giới tính",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    "*",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  )
                ],
              ),
              Container(
                height: 60.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Obx(
                      () => DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    value: controller.gennerValue.value,
                    items: <String>['Khác', 'Nam', 'Nữ']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.gennerValue.value = newValue!;
                    },
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }


  Container Name() {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Họ và tên",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                "*",
                style: TextStyle(fontSize: 15, color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller.name,
            decoration: InputDecoration(
                hintText: "Họ và tên",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide())),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Nhập họ và tên của bạn";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

}