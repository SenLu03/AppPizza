import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController{
  void onPressAccount(){
    Get.toNamed(AppRouter.accountScreen);
  }
  void onPressNoti(){

  }
  onPressSeeOrder(){
    Get.toNamed(AppRouter.seeOder);
  }
  void onPressMessage(){
    _makePhoneCall('0333977550');
  }
  void onPressLogout(){
    print('check out');
    Get.offAndToNamed(AppRouter.login);
  }
  void _makePhoneCall(String phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

}