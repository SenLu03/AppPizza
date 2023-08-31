import 'package:btl_flutter/controller/state_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateMainScreen extends GetView<StateMainController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: controller.selectedIndex.value!=0?Colors.grey:Colors.blue,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza_outlined, color: controller.selectedIndex.value!=1?Colors.grey:Colors.blue),
            label: 'Thực đơn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount_outlined, color:controller.selectedIndex.value!=2?Colors.grey:Colors.blue),
            label: 'Đổi điểm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: controller.selectedIndex.value!=3?Colors.grey:Colors.blue),
            label: 'Tài Khoản',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.blue,
        onTap: controller.onItemTapped,
      )),
    );
  }
}