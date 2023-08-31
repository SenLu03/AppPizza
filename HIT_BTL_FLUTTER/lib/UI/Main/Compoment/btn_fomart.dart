import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/UI/Main/Screen/map_screen.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:btl_flutter/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnShip extends GetView<MainScreenController> {
  const BtnShip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
       controller.onPressCallGoogleMap();
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
            Icons.local_shipping,
            color: Colors.red,
          ),
          title: Text(
            'Giao hàng tận nơi',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Hãy cho chúng tôi biết vi trí của bạn'),
          trailing: Icon(Icons.navigate_next),
        ),
      ),
    );
  }


}
