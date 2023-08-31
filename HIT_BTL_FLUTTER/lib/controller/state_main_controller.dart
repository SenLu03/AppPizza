import 'package:btl_flutter/UI/Main/Screen/MainScreen.dart';
import 'package:btl_flutter/UI/discount/discount_screen.dart';
import 'package:btl_flutter/UI/setting/setting_screen.dart';
import 'package:get/get.dart';

import '../UI/Menu/menu_screen.dart';

class StateMainController extends GetxController{
  final List screens=[
    MainScreen(),
    MenuScreen(),
    DiscoutScreen(),
    SettingScreen(),
  ];
  RxInt selectedIndex=0.obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

}