import 'package:btl_flutter/UI/Main/Compoment/btn_fomart.dart';
import 'package:btl_flutter/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';

import '../../login/Component/Logo/Logo.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Compoment/btn2.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(child: Logo()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            Image.network(
              'https://cdn.pizzahut.vn/images/Web_V3/Homepage/HOME%20TOP%20BANNER%20PC_COMBO%20VI%CC%A3%20HE%CC%80_4S5UV_200620231000.jpg',
              height: Get.height / 5,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Chào mừng trở lại!',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:5
                  ),
                  Text(
                    'Vui lòng chọn Giao Hàng Tận Nơi hoặc Mua Mang Về',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            const BtnShip(),
            const Btn2(),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ưu đãi khủng',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.onPressSeeMenu();
                    },
                    child: const Text(
                      'Xem ưu đãi',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.getData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child:
                              Image.network(controller.getData.value[index].image!),
                        ),
                        onTap: () {
                          controller.onPressCombo(index);
                        },
                      );
                    }),
              ),
            ),
            //     Row(
            //       children: [
            //         TextButton(
            //             onPressed: () {
            //               controller.onPressSeeMenu();
            //             },
            //             child: const Text(
            //               'Xem thực đơn',
            //               style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //       ],
            //     ),
            //   SizedBox(
            //   height: 150,
            //   child: Obx(
            //     () => ListView.builder(
            //         itemCount: controller.get.length,
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           return InkWell(
            //             child: Container(
            //               margin: const EdgeInsets.all(8),
            //               child:
            //                   Image.network(controller.get.value[index].image!),
            //             ),
            //             onTap: () {
            //               controller.onPressCombo(index);
            //             },
            //           );
            //         }),
            //   ),
            // ),


          ],
        ),
      ),
    );
  }
}
