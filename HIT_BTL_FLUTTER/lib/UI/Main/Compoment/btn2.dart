import 'package:btl_flutter/controller/main_screen_controller.dart';
import 'package:btl_flutter/controller/state_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Btn2 extends GetView<MainScreenController> {
  const Btn2({super.key});


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
      Get.find<StateMainController>().selectedIndex.value=1;
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 5.0.sp,
              spreadRadius: 1.0.sp,
              color: Colors.black.withOpacity(0.5),
            )
          ],
        ),
        child: const ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.red,
          ),
          title: Text(
            'Mua tại cửa hàng',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Xem khoảng cách của bạn với cửa hàng'),
          trailing: Icon(Icons.navigate_next),
        ),
      ),
    );
  }

}
