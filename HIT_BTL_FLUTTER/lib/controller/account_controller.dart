import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/Data/User.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountController extends GetxController{
  late User? user;
  RxBool viewInfor=false.obs;


  onPressChangePassWord(){
    Get.toNamed(AppRouter.changePassScreen);
  }
  onPressChangeInfo(){
    Get.toNamed(AppRouter.changeInfScreen);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    user=Get.find<AppControleer>().currentUser;
    super.onInit();
  }
  String formatBirthday(String birthday) {
    
    return birthday.substring(0,10);
  }
}