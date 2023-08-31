import 'package:btl_flutter/call_API/get_api.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:get/get.dart';

import '../Data/User.dart';

class DiscountController extends GetxController{
  RxList listProduct=[].obs;
  late User user;
  late RxInt point=user.point.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    user=Get.find<AppControleer>().currentUser;
    point.value=user.point;
    listProduct.value= await GetApi.getProducts();
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    user=Get.find<AppControleer>().currentUser;
    point.value=user.point;
    print('point2: $point');
    super.onReady();
  }
  void updatePoint(){
    user=Get.find<AppControleer>().currentUser;
    point.value=user.point;
  }

}